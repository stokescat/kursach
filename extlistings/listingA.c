STATIC EFI_STATUS
_Ext4Flush(
	IN EFI_FILE_PROTOCOL* This
) {
  EXT4_FILE  *File;
  File = EXT4_FILE_FROM_THIS (This);
  
  if (!(File->OpenMode & EFI_FILE_MODE_WRITE)) {
    return EFI_ACCESS_DENIED;
  }
  return EFI_WRITE_PROTECTED;
}
