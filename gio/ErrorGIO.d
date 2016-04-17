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


module gio.ErrorGIO;

private import gi.gio;
public  import gi.giotypes;


/** */
public struct ErrorGIO
{

	/**
	 * Converts errno.h error codes into GIO error codes. The fallback
	 * value %G_IO_ERROR_FAILED is returned for error codes not currently
	 * handled (but note that future GLib releases may return a more
	 * specific value instead).
	 *
	 * Params:
	 *     errNo = Error number as defined in errno.h.
	 *
	 * Return: #GIOErrorEnum value for the given errno.h error number.
	 */
	public static GIOErrorEnum ioErrorFromErrno(int errNo)
	{
		return g_io_error_from_errno(errNo);
	}

	/**
	 * Gets the GIO Error Quark.
	 *
	 * Return: a #GQuark.
	 */
	public static GQuark ioErrorQuark()
	{
		return g_io_error_quark();
	}
}
