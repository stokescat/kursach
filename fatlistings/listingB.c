....
Info->Size = ResultSize;
 if ((Entry->Attributes & FAT_ATTRIBUTE_DIRECTORY) != 0) {
@-- Cluster =  ((Entry->FileClusterHigh << 16) | Entry->FileCluster); -@
@++ Cluster =  (( ((UINTN) Entry->FileClusterHigh) << 16) | ((UINTN) Entry->FileCluster)); +@
  Info->PhysicalSize = FatPhysicalDirSize (Volume, Cluster);
....
