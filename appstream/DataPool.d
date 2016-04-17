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


module appstream.DataPool;

private import appstream.Component;
private import gi.appstream;
public  import gi.appstreamtypes;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.ListG;
private import glib.PtrArray;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class DataPool : ObjectG
{
	/** the main GObject struct */
	protected AsDataPool* asDataPool;

	/** Get the main GObject struct */
	public AsDataPool* getDataPoolStruct()
	{
		return asDataPool;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)asDataPool;
	}

	protected override void setStruct(GObject* obj)
	{
		asDataPool = cast(AsDataPool*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AsDataPool* asDataPool, bool ownedRef = false)
	{
		this.asDataPool = asDataPool;
		super(cast(GObject*)asDataPool, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return as_data_pool_get_type();
	}

	/**
	 * Creates a new #AsDataPool.
	 *
	 * Return: a #AsDataPool
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this()
	{
		auto p = as_data_pool_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(AsDataPool*) p, true);
	}

	/**
	 * Return: An error quark.
	 */
	public static GQuark errorQuark()
	{
		return as_data_pool_error_quark();
	}

	/**
	 * Get a specific component by its ID.
	 *
	 * Params:
	 *     id = The AppStream-ID to look for.
	 *
	 * Return: An #AsComponent
	 */
	public Component getComponentById(string id)
	{
		auto p = as_data_pool_get_component_by_id(asDataPool, Str.toStringz(id));
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(Component)(cast(AsComponent*) p, true);
	}

	/**
	 * Get a list of found components.
	 *
	 * Return: a list of #AsComponent instances, free with g_list_free()
	 */
	public ListG getComponents()
	{
		auto p = as_data_pool_get_components(asDataPool);
		
		if(p is null)
		{
			return null;
		}
		
		return new ListG(cast(GList*) p);
	}

	/**
	 * Gets the currently used locale.
	 *
	 * Return: Locale used for metadata parsing.
	 */
	public string getLocale()
	{
		return Str.toString(as_data_pool_get_locale(asDataPool));
	}

	/**
	 * Return a list of all locations which are searched for metadata.
	 *
	 * Return: A string-list of watched (absolute) filepaths
	 */
	public PtrArray getMetadataLocations()
	{
		auto p = as_data_pool_get_metadata_locations(asDataPool);
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Sets the current locale which should be used when parsing metadata.
	 *
	 * Params:
	 *     locale = the locale.
	 */
	public void setLocale(string locale)
	{
		as_data_pool_set_locale(asDataPool, Str.toStringz(locale));
	}

	/**
	 * Set locations for the data pool to read it's data from.
	 * This is mainly used for testing purposes. Each location should have an
	 * "xmls" and/or "yaml" subdirectory with the actual data as (compressed)
	 * AppStream XML or DEP-11 YAML in it.
	 *
	 * Params:
	 *     dirs = a zero-terminated array of data input directories.
	 */
	public void setMetadataLocations(string[] dirs)
	{
		as_data_pool_set_metadata_locations(asDataPool, Str.toStringzArray(dirs));
	}

	/**
	 * Builds an index of all found components in the watched locations.
	 * The function will try to get as much data into the pool as possible, so even if
	 * the updates completes with %FALSE, it might still add components to the pool.
	 *
	 * Return: %TRUE if update completed without error.
	 *
	 * Throws: GException on failure.
	 */
	public bool update()
	{
		GError* err = null;
		
		auto p = as_data_pool_update(asDataPool, &err) != 0;
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		return p;
	}
}
