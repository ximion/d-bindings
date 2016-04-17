/*
 * Licensed under the GNU Lesser General Public License Version 3
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the license, or
 * (at your option) any later version.
 *
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
 */

// generated automatically - do not change


module gio.DesktopAppInfoLookupIF;

private import gi.gio;
public  import gi.giotypes;
private import gio.AppInfo;
private import gio.AppInfoIF;
private import glib.Str;
private import gobject.ObjectG;


/**
 * #GDesktopAppInfoLookup is an opaque data structure and can only be accessed
 * using the following functions.
 */
public interface DesktopAppInfoLookupIF{
	/** Get the main GObject struct */
	public GDesktopAppInfoLookup* getDesktopAppInfoLookupStruct();

	/** the main GObject struct as a void* */
	protected void* getStruct();


	/**
	 * Gets the default application for launching applications
	 * using this URI scheme for a particular GDesktopAppInfoLookup
	 * implementation.
	 *
	 * The GDesktopAppInfoLookup interface and this function is used
	 * to implement g_app_info_get_default_for_uri_scheme() backends
	 * in a GIO module. There is no reason for applications to use it
	 * directly. Applications should use g_app_info_get_default_for_uri_scheme().
	 *
	 * Deprecated: The #GDesktopAppInfoLookup interface is deprecated and unused by gio.
	 *
	 * Params:
	 *     uriScheme = a string containing a URI scheme.
	 *
	 * Return: #GAppInfo for given @uri_scheme or %NULL on error.
	 */
	public AppInfoIF getDefaultForUriScheme(string uriScheme);
}
