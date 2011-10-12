<cfloop collection="attributes" item="attr">
	<cfset thisn = structNew()>
	<cfset thisn[attr] = attributes[attr]>
	<cfset arrayAppend(application.debugLog, thisn)>
</cfloop>
