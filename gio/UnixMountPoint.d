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


module gio.UnixMountPoint;

private import gi.gio;
public  import gi.giotypes;
private import gio.Icon;
private import gio.IconIF;
private import glib.Str;
private import gobject.ObjectG;


/**
 * Defines a Unix mount point (e.g. <filename>/dev</filename>).
 * This corresponds roughly to a fstab entry.
 */
public class UnixMountPoint
{
	/** the main GObject struct */
	protected GUnixMountPoint* gUnixMountPoint;

	/** Get the main GObject struct */
	public GUnixMountPoint* getUnixMountPointStruct()
	{
		return gUnixMountPoint;
	}

	/** the main GObject struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gUnixMountPoint;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GUnixMountPoint* gUnixMountPoint)
	{
		this.gUnixMountPoint = gUnixMountPoint;
	}


	/**
	 * Compares two unix mount points.
	 *
	 * Params:
	 *     mount2 = a #GUnixMount.
	 *
	 * Return: 1, 0 or -1 if @mount1 is greater than, equal to,
	 *     or less than @mount2, respectively.
	 */
	public int compare(UnixMountPoint mount2)
	{
		return g_unix_mount_point_compare(gUnixMountPoint, (mount2 is null) ? null : mount2.getUnixMountPointStruct());
	}

	/**
	 * Frees a unix mount point.
	 */
	public void free()
	{
		g_unix_mount_point_free(gUnixMountPoint);
	}

	/**
	 * Gets the device path for a unix mount point.
	 *
	 * Return: a string containing the device path.
	 */
	public string getDevicePath()
	{
		return Str.toString(g_unix_mount_point_get_device_path(gUnixMountPoint));
	}

	/**
	 * Gets the file system type for the mount point.
	 *
	 * Return: a string containing the file system type.
	 */
	public string getFsType()
	{
		return Str.toString(g_unix_mount_point_get_fs_type(gUnixMountPoint));
	}

	/**
	 * Gets the mount path for a unix mount point.
	 *
	 * Return: a string containing the mount path.
	 */
	public string getMountPath()
	{
		return Str.toString(g_unix_mount_point_get_mount_path(gUnixMountPoint));
	}

	/**
	 * Gets the options for the mount point.
	 *
	 * Return: a string containing the options.
	 *
	 * Since: 2.32
	 */
	public string getOptions()
	{
		return Str.toString(g_unix_mount_point_get_options(gUnixMountPoint));
	}

	/**
	 * Guesses whether a Unix mount point can be ejected.
	 *
	 * Return: %TRUE if @mount_point is deemed to be ejectable.
	 */
	public bool guessCanEject()
	{
		return g_unix_mount_point_guess_can_eject(gUnixMountPoint) != 0;
	}

	/**
	 * Guesses the icon of a Unix mount point.
	 *
	 * Return: a #GIcon
	 */
	public IconIF guessIcon()
	{
		auto p = g_unix_mount_point_guess_icon(gUnixMountPoint);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(Icon, IconIF)(cast(GIcon*) p);
	}

	/**
	 * Guesses the name of a Unix mount point.
	 * The result is a translated string.
	 *
	 * Return: A newly allocated string that must
	 *     be freed with g_free()
	 */
	public string guessName()
	{
		return Str.toString(g_unix_mount_point_guess_name(gUnixMountPoint));
	}

	/**
	 * Guesses the symbolic icon of a Unix mount point.
	 *
	 * Return: a #GIcon
	 *
	 * Since: 2.34
	 */
	public IconIF guessSymbolicIcon()
	{
		auto p = g_unix_mount_point_guess_symbolic_icon(gUnixMountPoint);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(Icon, IconIF)(cast(GIcon*) p);
	}

	/**
	 * Checks if a unix mount point is a loopback device.
	 *
	 * Return: %TRUE if the mount point is a loopback. %FALSE otherwise.
	 */
	public bool isLoopback()
	{
		return g_unix_mount_point_is_loopback(gUnixMountPoint) != 0;
	}

	/**
	 * Checks if a unix mount point is read only.
	 *
	 * Return: %TRUE if a mount point is read only.
	 */
	public bool isReadonly()
	{
		return g_unix_mount_point_is_readonly(gUnixMountPoint) != 0;
	}

	/**
	 * Checks if a unix mount point is mountable by the user.
	 *
	 * Return: %TRUE if the mount point is user mountable.
	 */
	public bool isUserMountable()
	{
		return g_unix_mount_point_is_user_mountable(gUnixMountPoint) != 0;
	}
}
