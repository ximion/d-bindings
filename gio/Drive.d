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


module gio.Drive;

private import gi.gio;
public  import gi.giotypes;
private import gio.DriveIF;
private import gio.DriveT;
private import gobject.ObjectG;


/** */
public class Drive : ObjectG, DriveIF
{
	/** the main GObject struct */
	protected GDrive* gDrive;

	/** Get the main GObject struct */
	public GDrive* getDriveStruct()
	{
		return gDrive;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gDrive;
	}

	protected override void setStruct(GObject* obj)
	{
		gDrive = cast(GDrive*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GDrive* gDrive, bool ownedRef = false)
	{
		this.gDrive = gDrive;
		super(cast(GObject*)gDrive, ownedRef);
	}

	// add the Drive capabilities
	mixin DriveT!(GDrive);

}
