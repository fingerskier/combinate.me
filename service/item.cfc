<cfcomponent>
	<cffunction access="remote" name="create">
		<cfargument name="note" default="" type="string">
		<cfargument name="URL" default="" type="string">
		<cfargument name="active" default="" type="boolean">

		<cfset var thisItem = entityNew("item")>
		<cfset thisItem.setActive(arguments.active)>
		<cfset thisItem.setCreated(now())>
		<cfset thisItem.setNote(arguments.note)>
		<cfset thisItem.setUpdated(now())>
		<cfset thisItem.setURL(arguments.URL)>

		<cfset entitySave(thisItem)>
	</cffunction>

	<cffunction access="remote" name="hideInactives">
		<cfargument name="inactiveIDs" type="string">

		<cfquery>
			update item set
   				Hidden = 1,
   				Updated = #createODBCDateTime(now())#
   			where ID in (<cfqueryparam cfsqltype="cf_sql_integer" list="true" value="#arguments.inactiveIDs#">)
		</cfquery>
	</cffunction>

	<cffunction access="remote" name="read" returnformat="JSON" returntype="Array">
		<cfreturn entityload("item", {
			hidden = 0
		})>
	</cffunction>
</cfcomponent>
