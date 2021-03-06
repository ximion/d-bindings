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


module gio.DBusError;

private import gi.gio;
public  import gi.giotypes;
private import glib.ErrorG;
private import glib.Str;


/** */
public struct DBusError
{

	/**
	 * Creates a D-Bus error name to use for @error. If @error matches
	 * a registered error (cf. g_dbus_error_register_error()), the corresponding
	 * D-Bus error name will be returned.
	 *
	 * Otherwise the a name of the form
	 * `org.gtk.GDBus.UnmappedGError.Quark._ESCAPED_QUARK_NAME.Code_ERROR_CODE`
	 * will be used. This allows other GDBus applications to map the error
	 * on the wire back to a #GError using g_dbus_error_new_for_dbus_error().
	 *
	 * This function is typically only used in object mappings to put a
	 * #GError on the wire. Regular applications should not use it.
	 *
	 * Params:
	 *     error = A #GError.
	 *
	 * Return: A D-Bus error name (never %NULL). Free with g_free().
	 *
	 * Since: 2.26
	 */
	public static string encodeGerror(ErrorG error)
	{
		return Str.toString(g_dbus_error_encode_gerror((error is null) ? null : error.getErrorGStruct()));
	}

	/**
	 * Gets the D-Bus error name used for @error, if any.
	 *
	 * This function is guaranteed to return a D-Bus error name for all
	 * #GErrors returned from functions handling remote method calls
	 * (e.g. g_dbus_connection_call_finish()) unless
	 * g_dbus_error_strip_remote_error() has been used on @error.
	 *
	 * Params:
	 *     error = a #GError
	 *
	 * Return: an allocated string or %NULL if the D-Bus error name
	 *     could not be found. Free with g_free().
	 *
	 * Since: 2.26
	 */
	public static string getRemoteError(ErrorG error)
	{
		return Str.toString(g_dbus_error_get_remote_error((error is null) ? null : error.getErrorGStruct()));
	}

	/**
	 * Checks if @error represents an error received via D-Bus from a remote peer. If so,
	 * use g_dbus_error_get_remote_error() to get the name of the error.
	 *
	 * Params:
	 *     error = A #GError.
	 *
	 * Return: %TRUE if @error represents an error from a remote peer,
	 *     %FALSE otherwise.
	 *
	 * Since: 2.26
	 */
	public static bool isRemoteError(ErrorG error)
	{
		return g_dbus_error_is_remote_error((error is null) ? null : error.getErrorGStruct()) != 0;
	}

	/**
	 * Creates a #GError based on the contents of @dbus_error_name and
	 * @dbus_error_message.
	 *
	 * Errors registered with g_dbus_error_register_error() will be looked
	 * up using @dbus_error_name and if a match is found, the error domain
	 * and code is used. Applications can use g_dbus_error_get_remote_error()
	 * to recover @dbus_error_name.
	 *
	 * If a match against a registered error is not found and the D-Bus
	 * error name is in a form as returned by g_dbus_error_encode_gerror()
	 * the error domain and code encoded in the name is used to
	 * create the #GError. Also, @dbus_error_name is added to the error message
	 * such that it can be recovered with g_dbus_error_get_remote_error().
	 *
	 * Otherwise, a #GError with the error code %G_IO_ERROR_DBUS_ERROR
	 * in the #G_IO_ERROR error domain is returned. Also, @dbus_error_name is
	 * added to the error message such that it can be recovered with
	 * g_dbus_error_get_remote_error().
	 *
	 * In all three cases, @dbus_error_name can always be recovered from the
	 * returned #GError using the g_dbus_error_get_remote_error() function
	 * (unless g_dbus_error_strip_remote_error() hasn't been used on the returned error).
	 *
	 * This function is typically only used in object mappings to prepare
	 * #GError instances for applications. Regular applications should not use
	 * it.
	 *
	 * Params:
	 *     dbusErrorName = D-Bus error name.
	 *     dbusErrorMessage = D-Bus error message.
	 *
	 * Return: An allocated #GError. Free with g_error_free().
	 *
	 * Since: 2.26
	 */
	public static ErrorG newForDbusError(string dbusErrorName, string dbusErrorMessage)
	{
		auto p = g_dbus_error_new_for_dbus_error(Str.toStringz(dbusErrorName), Str.toStringz(dbusErrorMessage));
		
		if(p is null)
		{
			return null;
		}
		
		return new ErrorG(cast(GError*) p);
	}

	/** */
	public static GQuark quark()
	{
		return g_dbus_error_quark();
	}

	/**
	 * Creates an association to map between @dbus_error_name and
	 * #GErrors specified by @error_domain and @error_code.
	 *
	 * This is typically done in the routine that returns the #GQuark for
	 * an error domain.
	 *
	 * Params:
	 *     errorDomain = A #GQuark for a error domain.
	 *     errorCode = An error code.
	 *     dbusErrorName = A D-Bus error name.
	 *
	 * Return: %TRUE if the association was created, %FALSE if it already
	 *     exists.
	 *
	 * Since: 2.26
	 */
	public static bool registerError(GQuark errorDomain, int errorCode, string dbusErrorName)
	{
		return g_dbus_error_register_error(errorDomain, errorCode, Str.toStringz(dbusErrorName)) != 0;
	}

	/**
	 * Helper function for associating a #GError error domain with D-Bus error names.
	 *
	 * Params:
	 *     errorDomainQuarkName = The error domain name.
	 *     quarkVolatile = A pointer where to store the #GQuark.
	 *     entries = A pointer to @num_entries #GDBusErrorEntry struct items.
	 *     numEntries = Number of items to register.
	 *
	 * Since: 2.26
	 */
	public static void registerErrorDomain(string errorDomainQuarkName, size_t* quarkVolatile, GDBusErrorEntry* entries, uint numEntries)
	{
		g_dbus_error_register_error_domain(Str.toStringz(errorDomainQuarkName), quarkVolatile, entries, numEntries);
	}

	/**
	 * Looks for extra information in the error message used to recover
	 * the D-Bus error name and strips it if found. If stripped, the
	 * message field in @error will correspond exactly to what was
	 * received on the wire.
	 *
	 * This is typically used when presenting errors to the end user.
	 *
	 * Params:
	 *     error = A #GError.
	 *
	 * Return: %TRUE if information was stripped, %FALSE otherwise.
	 *
	 * Since: 2.26
	 */
	public static bool stripRemoteError(ErrorG error)
	{
		return g_dbus_error_strip_remote_error((error is null) ? null : error.getErrorGStruct()) != 0;
	}

	/**
	 * Destroys an association previously set up with g_dbus_error_register_error().
	 *
	 * Params:
	 *     errorDomain = A #GQuark for a error domain.
	 *     errorCode = An error code.
	 *     dbusErrorName = A D-Bus error name.
	 *
	 * Return: %TRUE if the association was destroyed, %FALSE if it wasn't found.
	 *
	 * Since: 2.26
	 */
	public static bool unregisterError(GQuark errorDomain, int errorCode, string dbusErrorName)
	{
		return g_dbus_error_unregister_error(errorDomain, errorCode, Str.toStringz(dbusErrorName)) != 0;
	}
}
