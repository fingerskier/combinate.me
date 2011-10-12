component persistent="true" {
	property name="ID" fieldtype="id" generator="native" ormtype="integer" type="numeric";
	property name="Created" ormtype="boolean";
	property name="Updated" ormtype="boolean";
	property name="Valid" ormtype="boolean";
	property name="Active" ormtype="boolean";

	property name="FirstName" ormtype="string";
	property name="LastName" ormtype="string";
	property name="Email" ormtype="string";
	property name="Username" ormtype="string";
	property name="Password" ormtype="string";
}
