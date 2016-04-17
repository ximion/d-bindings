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


module gio.TlsFileDatabaseIF;

private import gi.gio;
public  import gi.giotypes;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import gobject.ObjectG;


/**
 * #GTlsFileDatabase is implemented by #GTlsDatabase objects which load
 * their certificate information from a file. It is an interface which
 * TLS library specific subtypes implement.
 *
 * Since: 2.30
 */
public interface TlsFileDatabaseIF{
	/** Get the main GObject struct */
	public GTlsFileDatabase* getTlsFileDatabaseStruct();

	/** the main GObject struct as a void* */
	protected void* getStruct();

}
