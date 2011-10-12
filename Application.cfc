<cfcomponent>
	<cfset this.applicationTimeout = createTimeSpan(0,1,0,0)>
	<cfset this.clientManagement = true>
	<cfset this.clientStorage = 'combinate'>
 	<cfset this.customTagPaths = expandPath('./tags')>
	<cfset this.datasource = 'combinate'>
	<cfset this.debugipaddress = '127.0.0.1'>
	<cfset this.name = "CombinateMe">

	<cfset this.ormenabled = true>
	<cfset this.ormsettings.cfclocation = "model">
	<cfset this.ormsettings.dbcreate = "dropcreate">
	<cfset this.ormsettings.dialect = "Derby">
	<cfset this.ormsettings.eventHandling = true>

	<cfset this.sessionManagement = true>
	<cfset this.sessionTimeout = createTimeSpan(0,0,30,0)>

	<cffunction name="onApplicationStart" returnType="boolean">

	    <cfreturn true>
	</cffunction>

	<cffunction name="onSessionStart" returnType="void">

	</cffunction>

	<cffunction name="onRequestStart" returnType="boolean">
	    <cfargument name="targetPage" required="true" type="String">

	    <cfreturn true>
	</cffunction>

	<cffunction name="onSessionEnd" returnType="void">
	    <cfargument name="SessionScope" required="True">
	    <cfargument name="ApplicationScope" required="False">

	</cffunction>

	<cffunction name="onApplicationEnd" returnType="void">
	    <cfargument name="ApplicationScope" required="true">

	</cffunction>
</cfcomponent>
