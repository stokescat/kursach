....
  Partition = File->Partition;
  
@-- ASSERT (Ext4FileIsOpenable (File)); -@
@++ if (!Ext4FileIsOpenable(File)) { +@
@++    return EFI_DEVICE_ERROR; +@
@++ } +@

  if (Ext4FileIsReg (File)) {
....
