enum UserRole {
  admin('admin', 'Administrator'),
  manager('manager', 'Manager'),
  member('member', 'Team Member'),
  viewer('viewer', 'Viewer');

  final String value;
  final String displayName;
  const UserRole(this.value, this.displayName);

}