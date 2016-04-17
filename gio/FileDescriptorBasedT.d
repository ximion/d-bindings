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


module gio.FileDescriptorBasedT;

public  import gi.gio;
public  import gi.giotypes;


/**
 * #GFileDescriptorBased is implemented by streams (implementations of
 * #GInputStream or #GOutputStream) that are based on file descriptors.
 * 
 * Note that `<gio/gfiledescriptorbased.h>` belongs to the UNIX-specific
 * GIO interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config
 * file when using it.
 */
public template FileDescriptorBasedT(TStruct)
{
	/** Get the main GObject struct */
	public GFileDescriptorBased* getFileDescriptorBasedStruct()
	{
		return cast(GFileDescriptorBased*)getStruct();
	}


	/**
	 * Gets the underlying file descriptor.
	 *
	 * Return: The file descriptor
	 *
	 * Since: 2.24
	 */
	public int getFd()
	{
		return g_file_descriptor_based_get_fd(getFileDescriptorBasedStruct());
	}
}
