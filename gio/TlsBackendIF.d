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


module gio.TlsBackendIF;

private import gi.gio;
public  import gi.giotypes;
private import gio.TlsBackend;
private import gio.TlsBackendIF;
private import gio.TlsDatabase;
private import gobject.ObjectG;


/**
 * TLS (Transport Layer Security, aka SSL) backend
 *
 * Since: 2.28
 */
public interface TlsBackendIF{
	/** Get the main GObject struct */
	public GTlsBackend* getTlsBackendStruct();

	/** the main GObject struct as a void* */
	protected void* getStruct();


	/**
	 * Gets the default #GTlsBackend for the system.
	 *
	 * Return: a #GTlsBackend
	 *
	 * Since: 2.28
	 */
	public static TlsBackendIF getDefault();

	/**
	 * Gets the #GType of @backend's #GTlsCertificate implementation.
	 *
	 * Return: the #GType of @backend's #GTlsCertificate
	 *     implementation.
	 *
	 * Since: 2.28
	 */
	public GType getCertificateType();

	/**
	 * Gets the #GType of @backend's #GTlsClientConnection implementation.
	 *
	 * Return: the #GType of @backend's #GTlsClientConnection
	 *     implementation.
	 *
	 * Since: 2.28
	 */
	public GType getClientConnectionType();

	/**
	 * Gets the default #GTlsDatabase used to verify TLS connections.
	 *
	 * Return: the default database, which should be
	 *     unreffed when done.
	 *
	 * Since: 2.30
	 */
	public TlsDatabase getDefaultDatabase();

	/**
	 * Gets the #GType of @backend's #GTlsFileDatabase implementation.
	 *
	 * Return: the #GType of backend's #GTlsFileDatabase implementation.
	 *
	 * Since: 2.30
	 */
	public GType getFileDatabaseType();

	/**
	 * Gets the #GType of @backend's #GTlsServerConnection implementation.
	 *
	 * Return: the #GType of @backend's #GTlsServerConnection
	 *     implementation.
	 *
	 * Since: 2.28
	 */
	public GType getServerConnectionType();

	/**
	 * Checks if TLS is supported; if this returns %FALSE for the default
	 * #GTlsBackend, it means no "real" TLS backend is available.
	 *
	 * Return: whether or not TLS is supported
	 *
	 * Since: 2.28
	 */
	public bool supportsTls();
}
