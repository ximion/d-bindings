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


module appstream.Database;

private import appstream.Component;
private import gi.appstream;
public  import gi.appstreamtypes;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.PtrArray;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class Database : ObjectG
{
	/** the main GObject struct */
	protected AsDatabase* asDatabase;

	/** Get the main GObject struct */
	public AsDatabase* getDatabaseStruct()
	{
		return asDatabase;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)asDatabase;
	}

	protected override void setStruct(GObject* obj)
	{
		asDatabase = cast(AsDatabase*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AsDatabase* asDatabase, bool ownedRef = false)
	{
		this.asDatabase = asDatabase;
		super(cast(GObject*)asDatabase, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return as_database_get_type();
	}

	/**
	 * Creates a new #AsDatabase.
	 *
	 * Return: a #AsDatabase
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this()
	{
		auto p = as_database_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(AsDatabase*) p, true);
	}

	/**
	 * Return: An error quark.
	 */
	public static GQuark errorQuark()
	{
		return as_database_error_quark();
	}

	/**
	 * Find components in the AppStream database, which match a given term.
	 * You can limit the search to a specific set of categories by setting the categories string to
	 * a semicolon-separated list of lower-cased category names.
	 *
	 * Params:
	 *     term = a search-term to look for.
	 *     catsStr = A semicolon-delimited list of lower-cased category names, e.g. "science;development".
	 *
	 * Return: an array of #AsComponent objects which have been found
	 *
	 * Throws: GException on failure.
	 */
	public PtrArray findComponents(string term, string catsStr)
	{
		GError* err = null;
		
		auto p = as_database_find_components(asDatabase, Str.toStringz(term), Str.toStringz(catsStr), &err);
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Dump a list of all software components found in the database.
	 *
	 * Return: an array of #AsComponent objects.
	 *
	 * Throws: GException on failure.
	 */
	public PtrArray getAllComponents()
	{
		GError* err = null;
		
		auto p = as_database_get_all_components(asDatabase, &err);
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Get a component by its AppStream-ID.
	 *
	 * Params:
	 *     cid = the ID of the component, e.g. "org.kde.gwenview.desktop"
	 *
	 * Return: an #AsComponent or %NULL if none was found.
	 *
	 * Throws: GException on failure.
	 */
	public Component getComponentById(string cid)
	{
		GError* err = null;
		
		auto p = as_database_get_component_by_id(asDatabase, Str.toStringz(cid), &err);
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(Component)(cast(AsComponent*) p, true);
	}

	/**
	 * Return a list of all components in the database which match a certain kind.
	 *
	 * Params:
	 *     kind = an #AsComponentKind.
	 *
	 * Return: an array of #AsComponent objects which have been found, %NULL on error
	 *
	 * Throws: GException on failure.
	 */
	public PtrArray getComponentsByKind(AsComponentKind kind)
	{
		GError* err = null;
		
		auto p = as_database_get_components_by_kind(asDatabase, kind, &err);
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Find components in the Appstream database.
	 *
	 * Params:
	 *     kind = an #AsProvidesKind
	 *     item = the name of the provided item.
	 *
	 * Return: an array of #AsComponent objects which have been found, NULL on error
	 *
	 * Throws: GException on failure.
	 */
	public PtrArray getComponentsByProvidedItem(AsProvidedKind kind, string item)
	{
		GError* err = null;
		
		auto p = as_database_get_components_by_provided_item(asDatabase, kind, Str.toStringz(item), &err);
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Get the current path of the AppStream database we use.
	 */
	public string getLocation()
	{
		return Str.toString(as_database_get_location(asDatabase));
	}

	/**
	 * Open the current AppStream metadata cache for reading.
	 *
	 * Return: %TRUE on success, %FALSE on error.
	 *
	 * Throws: GException on failure.
	 */
	public bool open()
	{
		GError* err = null;
		
		auto p = as_database_open(asDatabase, &err) != 0;
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		return p;
	}

	/**
	 * Set the location of the AppStream database we use.
	 *
	 * Params:
	 *     dir = The directory of the Xapian database.
	 */
	public void setLocation(string dir)
	{
		as_database_set_location(asDatabase, Str.toStringz(dir));
	}
}
