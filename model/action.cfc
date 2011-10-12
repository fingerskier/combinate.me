component persistent="true" {
	property name="ID" fieldtype="id" generator="native" ormtype="integer" type="numeric";
	property name="updated" type="date";
	property name="created" type="date";
	property name="active" type="boolean";
	property name="hidden" type="boolean";

	property name="items" cfc="item" fieldType="one-to-many" fkcolumn="actionID" inverse="true";

	property name="code" ormtype="string";
}
