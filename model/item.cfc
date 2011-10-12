component persistent="true" {
	property name="ID" fieldtype="id" generator="native" ormtype="integer" type="numeric";
	property name="Updated" ormtype="timestamp";
	property name="Created" ormtype="timestamp";
	property name="Active" default="1"  type="boolean";
	property name="Hidden" default="0"  type="boolean";

	property name="Action" cfc="action" fieldtype="many-to-one" fkcolumn="actionID";

	property name="Note" type="string";
	property name="URL" type="string";
}
