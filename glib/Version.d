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


module glib.Version;

private import gi.glib;
public  import gi.glibtypes;
private import glib.Str;


/** */
public struct Version
{

	/**
	 * Checks that the GLib library in use is compatible with the
	 * given version. Generally you would pass in the constants
	 * #GLIB_MAJOR_VERSION, #GLIB_MINOR_VERSION, #GLIB_MICRO_VERSION
	 * as the three arguments to this function; that produces
	 * a check that the library in use is compatible with
	 * the version of GLib the application or module was compiled
	 * against.
	 *
	 * Compatibility is defined by two things: first the version
	 * of the running library is newer than the version
	 * @required_major.required_minor.@required_micro. Second
	 * the running library must be binary compatible with the
	 * version @required_major.required_minor.@required_micro
	 * (same major version.)
	 *
	 * Params:
	 *     requiredMajor = the required major version
	 *     requiredMinor = the required minor version
	 *     requiredMicro = the required micro version
	 *
	 * Return: %NULL if the GLib library is compatible with the
	 *     given version, or a string describing the version mismatch.
	 *     The returned string is owned by GLib and must not be modified
	 *     or freed.
	 *
	 * Since: 2.6
	 */
	public static string checkVersion(uint requiredMajor, uint requiredMinor, uint requiredMicro)
	{
		return Str.toString(glib_check_version(requiredMajor, requiredMinor, requiredMicro));
	}
}
