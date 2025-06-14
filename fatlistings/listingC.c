@@@ BEFORE @@@
 if (Parent != NULL) {
  Volume             = Parent->Volume;
  OFile->FullPathLen = Parent->FullPathLen + 1 + StrLen (DirEnt->FileString);
/*>*/  OFile->FileCluster = ((DirEnt->Entry.FileClusterHigh) << 16) | (DirEnt->Entry.FileCluster);
  InsertTailList (&Parent->ChildHead, &OFile->ChildLink);

@@@ AFTER @@@
 if (Parent != NULL) {
  Volume             = Parent->Volume;
  OFile->FullPathLen = Parent->FullPathLen + 1 + StrLen (DirEnt->FileString);
/*>*/  OFile->FileCluster = (((UINTN) DirEnt->Entry.FileClusterHigh) << 16) | ((UINTN) DirEnt->Entry.FileCluster);
  InsertTailList (&Parent->ChildHead, &OFile->ChildLink);
