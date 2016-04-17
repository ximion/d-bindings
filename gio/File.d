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


module gio.File;

private import gi.gio;
public  import gi.giotypes;
private import gio.FileIF;
private import gio.FileT;
private import gobject.ObjectG;


/** */
public class File : ObjectG, FileIF
{
	/** the main GObject struct */
	protected GFile* gFile;

	/** Get the main GObject struct */
	public GFile* getFileStruct()
	{
		return gFile;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gFile;
	}

	protected override void setStruct(GObject* obj)
	{
		gFile = cast(GFile*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GFile* gFile, bool ownedRef = false)
	{
		this.gFile = gFile;
		super(cast(GObject*)gFile, ownedRef);
	}

	// add the File capabilities
	mixin FileT!(GFile);

}
