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


module appstream.DistroDetails;

private import gi.appstream;
public  import gi.appstreamtypes;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class DistroDetails : ObjectG
{
	/** the main GObject struct */
	protected AsDistroDetails* asDistroDetails;

	/** Get the main GObject struct */
	public AsDistroDetails* getDistroDetailsStruct()
	{
		return asDistroDetails;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)asDistroDetails;
	}

	protected override void setStruct(GObject* obj)
	{
		asDistroDetails = cast(AsDistroDetails*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AsDistroDetails* asDistroDetails, bool ownedRef = false)
	{
		this.asDistroDetails = asDistroDetails;
		super(cast(GObject*)asDistroDetails, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return as_distro_details_get_type();
	}

	/**
	 * Creates a new instance of #AsDistroDetails.
	 *
	 * Return: a #AsDistroDetails.
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this()
	{
		auto p = as_distro_details_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(AsDistroDetails*) p, true);
	}

	/** */
	public bool getBool(string key)
	{
		return as_distro_details_get_bool(asDistroDetails, Str.toStringz(key)) != 0;
	}

	/** */
	public string getId()
	{
		return Str.toString(as_distro_details_get_id(asDistroDetails));
	}

	/** */
	public string getName()
	{
		return Str.toString(as_distro_details_get_name(asDistroDetails));
	}

	/** */
	public string getStr(string key)
	{
		return Str.toString(as_distro_details_get_str(asDistroDetails, Str.toStringz(key)));
	}

	/** */
	public string getVersion()
	{
		return Str.toString(as_distro_details_get_version(asDistroDetails));
	}
}
