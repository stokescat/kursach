EFI_STATUS
FatQueueTask (
  IN FAT_IFILE  *IFile,
  IN FAT_TASK   *Task
) {
  .....
  BOOLEAN      LockAcquired;
  
  Status = EFI_SUCCESS;
  LockAcquired = FALSE;
  .....
  
  EfiAcquireLock (&FatTaskLock);
  LockAcquired = TRUE;
  
  Link = GetFirstNode (&Task->Subtasks);
  while (Link != &Task->Subtasks) {
    
    NextLink = Link->ForwardLink;
    Subtask = CR (Link, FAT_SUBTASK, Link, FAT_SUBTASK_SIGNATURE);
    
    EfiReleaseLock (&FatTaskLock);
    LockAcquired = FALSE;

    if (Subtask->Write) {
      Status = IFile->OFile->Volume->DiskIo2->WriteDiskEx (...);
    } else {
      Status = IFile->OFile->Volume->DiskIo2->ReadDiskEx (...);
    }

    if (EFI_ERROR (Status)) {
      break;
    }

    EfiAcquireLock (&FatTaskLock);
    LockAcquired = TRUE;
    Link = NextLink;
  }
  
  if (EFI_ERROR (Status)) {
    if (!LockAcquired) {
      EfiAcquireLock (&FatTaskLock);
      LockAcquired = TRUE;
    }
  
    while (!IsListEmpty (&Task->Subtasks)) {
      Link = GetFirstNode (&Task->Subtasks);
      Subtask = CR (Link, FAT_SUBTASK, Link, FAT_SUBTASK_SIGNATURE);
      RemoveEntryList (&Subtask->Link);
      gBS->CloseEvent (Subtask->DiskIo2Token.Event);
      FreePool (Subtask);
    }
    
    RemoveEntryList (&Task->Link);
    FreePool (Task);
  }
  
  if (LockAcquired) {
    EfiReleaseLock (&FatTaskLock);
  }

  return Status;
}
