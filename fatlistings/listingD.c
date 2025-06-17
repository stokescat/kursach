....
Status = FatGrowEof (OFile, EndPosition);
if (EFI_ERROR (Status)) {
....
 *BufferSize = 0;
 FatOFileFlush (OFile);
 OFile = NULL;
 
@++ if (Task != NULL) { +@
@++   FatDestroyTask (Task); +@
@++ } +@

@++FatReleaseLock (); +@
 goto Done;
}
 FatUpdateDirEntClusterSizeInfo (OFile);
....

@++FatReleaseLock (); +@
if (Token != NULL) {
 if (!EFI_ERROR (Status)) {
   Status = FatQueueTask (IFile, Task);
 } else {
   FatDestroyTask (Task);
 }
}
Done:
.....
@-- FatReleaseLock (); -@
  return Status;
}
.....
