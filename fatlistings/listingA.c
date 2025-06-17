.....
EFI_STATUS EFIAPI
FatReadEx (
  IN     EFI_FILE_PROTOCOL  *FHand,
  IN OUT EFI_FILE_IO_TOKEN  *Token
) {
@-- return FatIFileAccess (..., ReadData, ..., ..., ...); -@
@++ return FatIFileAccess (..., ReadDisk, ..., ..., ...); +@
}
.....
EFI_STATUS EFIAPI
FatWriteEx (
  IN     EFI_FILE_PROTOCOL  *FHand,
  IN OUT EFI_FILE_IO_TOKEN  *Token
) {
  .....
@-- return FatIFileAccess (..., WriteData, ..., ..., ...); -@
@++ return FatIFileAccess (..., WriteDisk, ..., ..., ...); +@
}
.....
