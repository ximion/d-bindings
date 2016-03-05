/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */

// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage


module gio.AppLaunchContext;

private import gi.gio;
public  import gi.giotypes;
private import gio.AppInfo;
private import gio.AppInfoIF;
private import gio.FileIF;
private import glib.ConstructionException;
private import glib.ListG;
private import glib.Str;
private import glib.Variant;
private import gobject.ObjectG;
private import gobject.Signals;


/**
 * Integrating the launch with the launching application. This is used to
 * handle for instance startup notification and launching the new application
 * on the same screen as the launching window.
 */
public class AppLaunchContext : ObjectG
{
	/** the main GObject struct */
	protected GAppLaunchContext* gAppLaunchContext;

	/** Get the main GObject struct */
	public GAppLaunchContext* getAppLaunchContextStruct()
	{
		return gAppLaunchContext;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gAppLaunchContext;
	}

	protected override void setStruct(GObject* obj)
	{
		gAppLaunchContext = cast(GAppLaunchContext*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GAppLaunchContext* gAppLaunchContext, bool ownedRef = false)
	{
		this.gAppLaunchContext = gAppLaunchContext;
		super(cast(GObject*)gAppLaunchContext, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return g_app_launch_context_get_type();
	}

	/**
	 * Creates a new application launch context. This is not normally used,
	 * instead you instantiate a subclass of this, such as #GdkAppLaunchContext.
	 *
	 * Return: a #GAppLaunchContext.
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this()
	{
		auto p = g_app_launch_context_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GAppLaunchContext*) p, true);
	}

	/**
	 * Gets the display string for the @context. This is used to ensure new
	 * applications are started on the same display as the launching
	 * application, by setting the `DISPLAY` environment variable.
	 *
	 * Params:
	 *     info = a #GAppInfo
	 *     files = a #GList of #GFile objects
	 *
	 * Return: a display string for the display.
	 */
	public string getDisplay(AppInfoIF info, ListG files)
	{
		return Str.toString(g_app_launch_context_get_display(gAppLaunchContext, (info is null) ? null : info.getAppInfoStruct(), (files is null) ? null : files.getListGStruct()));
	}

	/**
	 * Gets the complete environment variable list to be passed to
	 * the child process when @context is used to launch an application.
	 * This is a %NULL-terminated array of strings, where each string has
	 * the form `KEY=VALUE`.
	 *
	 * Return: the
	 *     child's environment
	 *
	 * Since: 2.32
	 */
	public string[] getEnvironment()
	{
		return Str.toStringArray(g_app_launch_context_get_environment(gAppLaunchContext));
	}

	/**
	 * Initiates startup notification for the application and returns the
	 * `DESKTOP_STARTUP_ID` for the launched operation, if supported.
	 *
	 * Startup notification IDs are defined in the
	 * [FreeDesktop.Org Startup Notifications standard](http://standards.freedesktop.org/startup-notification-spec/startup-notification-latest.txt").
	 *
	 * Params:
	 *     info = a #GAppInfo
	 *     files = a #GList of of #GFile objects
	 *
	 * Return: a startup notification ID for the application, or %NULL if
	 *     not supported.
	 */
	public string getStartupNotifyId(AppInfoIF info, ListG files)
	{
		return Str.toString(g_app_launch_context_get_startup_notify_id(gAppLaunchContext, (info is null) ? null : info.getAppInfoStruct(), (files is null) ? null : files.getListGStruct()));
	}

	/**
	 * Called when an application has failed to launch, so that it can cancel
	 * the application startup notification started in g_app_launch_context_get_startup_notify_id().
	 *
	 * Params:
	 *     startupNotifyId = the startup notification id that was returned by g_app_launch_context_get_startup_notify_id().
	 */
	public void launchFailed(string startupNotifyId)
	{
		g_app_launch_context_launch_failed(gAppLaunchContext, Str.toStringz(startupNotifyId));
	}

	/**
	 * Arranges for @variable to be set to @value in the child's
	 * environment when @context is used to launch an application.
	 *
	 * Params:
	 *     variable = the environment variable to set
	 *     value = the value for to set the variable to.
	 *
	 * Since: 2.32
	 */
	public void setenv(string variable, string value)
	{
		g_app_launch_context_setenv(gAppLaunchContext, Str.toStringz(variable), Str.toStringz(value));
	}

	/**
	 * Arranges for @variable to be unset in the child's environment
	 * when @context is used to launch an application.
	 *
	 * Params:
	 *     variable = the environment variable to remove
	 *
	 * Since: 2.32
	 */
	public void unsetenv(string variable)
	{
		g_app_launch_context_unsetenv(gAppLaunchContext, Str.toStringz(variable));
	}

	int[string] connectedSignals;

	void delegate(string, AppLaunchContext)[] onLaunchFailedListeners;
	/**
	 * The ::launch-failed signal is emitted when a #GAppInfo launch
	 * fails. The startup notification id is provided, so that the launcher
	 * can cancel the startup notification.
	 *
	 * Params:
	 *     startupNotifyId = the startup notification id for the failed launch
	 *
	 * Since: 2.36
	 */
	void addOnLaunchFailed(void delegate(string, AppLaunchContext) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		if ( "launch-failed" !in connectedSignals )
		{
			Signals.connectData(
				this,
				"launch-failed",
				cast(GCallback)&callBackLaunchFailed,
				cast(void*)this,
				null,
				connectFlags);
			connectedSignals["launch-failed"] = 1;
		}
		onLaunchFailedListeners ~= dlg;
	}
	extern(C) static void callBackLaunchFailed(GAppLaunchContext* applaunchcontextStruct, char* startupNotifyId, AppLaunchContext _applaunchcontext)
	{
		foreach ( void delegate(string, AppLaunchContext) dlg; _applaunchcontext.onLaunchFailedListeners )
		{
			dlg(Str.toString(startupNotifyId), _applaunchcontext);
		}
	}

	void delegate(AppInfoIF, Variant, AppLaunchContext)[] onLaunchedListeners;
	/**
	 * The ::launched signal is emitted when a #GAppInfo is successfully
	 * launched. The @platform_data is an GVariant dictionary mapping
	 * strings to variants (ie a{sv}), which contains additional,
	 * platform-specific data about this launch. On UNIX, at least the
	 * "pid" and "startup-notification-id" keys will be present.
	 *
	 * Params:
	 *     info = the #GAppInfo that was just launched
	 *     platformData = additional platform-specific data for this launch
	 *
	 * Since: 2.36
	 */
	void addOnLaunched(void delegate(AppInfoIF, Variant, AppLaunchContext) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		if ( "launched" !in connectedSignals )
		{
			Signals.connectData(
				this,
				"launched",
				cast(GCallback)&callBackLaunched,
				cast(void*)this,
				null,
				connectFlags);
			connectedSignals["launched"] = 1;
		}
		onLaunchedListeners ~= dlg;
	}
	extern(C) static void callBackLaunched(GAppLaunchContext* applaunchcontextStruct, GAppInfo* info, GVariant* platformData, AppLaunchContext _applaunchcontext)
	{
		foreach ( void delegate(AppInfoIF, Variant, AppLaunchContext) dlg; _applaunchcontext.onLaunchedListeners )
		{
			dlg(ObjectG.getDObject!(AppInfo, AppInfoIF)(info), new Variant(platformData), _applaunchcontext);
		}
	}
}
