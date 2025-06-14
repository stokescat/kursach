....
Status = FatGrowEof (OFile, EndPosition);
if (EFI_ERROR (Status)) {
....
 *BufferSize = 0;
 FatOFileFlush (OFile);
 OFile = NULL;
 /* MemoryLeak */
 if (Task != NULL) {
   FatDestroyTask (Task);
 }
 /* DeadLock */
 FatReleaseLock ();
 goto Done;
}
 FatUpdateDirEntClusterSizeInfo (OFile);
....
/* Deadlock */
FatReleaseLock ();
if (Token != NULL) {
 if (!EFI_ERROR (Status)) {
   Status = FatQueueTask (IFile, Task);
 } else {
   FatDestroyTask (Task);
 }
}
Done:
.....
/* DeadLock */
// FatReleaseLock ();
  return Status;
}
.....
