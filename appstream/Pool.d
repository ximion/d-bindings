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


module appstream.Pool;

private import appstream.Component;
private import gi.appstream;
public  import gi.appstreamtypes;
private import gio.Cancellable;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.PtrArray;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class Pool : ObjectG
{
	/** the main GObject struct */
	protected AsPool* asPool;

	/** Get the main GObject struct */
	public AsPool* getPoolStruct()
	{
		return asPool;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)asPool;
	}

	protected override void setStruct(GObject* obj)
	{
		asPool = cast(AsPool*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AsPool* asPool, bool ownedRef = false)
	{
		this.asPool = asPool;
		super(cast(GObject*)asPool, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return as_pool_get_type();
	}

	/**
	 * Creates a new #AsPool.
	 *
	 * Return: a #AsPool
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this()
	{
		auto p = as_pool_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(AsPool*) p, true);
	}

	/**
	 * Return: An error quark.
	 */
	public static GQuark errorQuark()
	{
		return as_pool_error_quark();
	}

	/**
	 * Register a new component in the AppStream metadata pool.
	 *
	 * Params:
	 *     cpt = The #AsComponent to add to the pool.
	 *
	 * Return: %TRUE if the new component was successfully added to the pool.
	 *
	 * Throws: GException on failure.
	 */
	public bool addComponent(Component cpt)
	{
		GError* err = null;
		
		auto p = as_pool_add_component(asPool, (cpt is null) ? null : cpt.getComponentStruct(), &err) != 0;
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		return p;
	}

	/**
	 * Remove all metadat from the pool.
	 */
	public void clear()
	{
		as_pool_clear(asPool);
	}

	/**
	 * Get the age of our internal cache.
	 */
	public uint getCacheAge()
	{
		return as_pool_get_cache_age(asPool);
	}

	/**
	 * Get the #AsCacheFlags for this data pool.
	 */
	public AsCacheFlags getCacheFlags()
	{
		return as_pool_get_cache_flags(asPool);
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
		auto p = as_pool_get_component_by_id(asPool, Str.toStringz(id));
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(Component)(cast(AsComponent*) p, true);
	}

	/**
	 * Get a list of found components.
	 *
	 * Return: an array of #AsComponent instances.
	 */
	public PtrArray getComponents()
	{
		auto p = as_pool_get_components(asPool);
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Return a list of components which are in one of the categories.
	 *
	 * Params:
	 *     categories = A semicolon-separated list of XDG categories to include.
	 *
	 * Return: an array of #AsComponent objects which have been found.
	 */
	public PtrArray getComponentsByCategories(string categories)
	{
		auto p = as_pool_get_components_by_categories(asPool, Str.toStringz(categories));
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Return a list of all components in the pool which are of a certain kind.
	 *
	 * Params:
	 *     kind = An #AsComponentKind.
	 *
	 * Return: an array of #AsComponent objects which have been found.
	 *
	 * Throws: GException on failure.
	 */
	public PtrArray getComponentsByKind(AsComponentKind kind)
	{
		GError* err = null;
		
		auto p = as_pool_get_components_by_kind(asPool, kind, &err);
		
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
	 * Find components in the AppStream data pool whcih provide a certain item.
	 *
	 * Params:
	 *     kind = An #AsProvidesKind
	 *     item = The value of the provided item.
	 *
	 * Return: an array of #AsComponent objects which have been found.
	 *
	 * Throws: GException on failure.
	 */
	public PtrArray getComponentsByProvidedItem(AsProvidedKind kind, string item)
	{
		GError* err = null;
		
		auto p = as_pool_get_components_by_provided_item(asPool, kind, Str.toStringz(item), &err);
		
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
	 * Gets the currently used locale.
	 *
	 * Return: Locale used for metadata parsing.
	 */
	public string getLocale()
	{
		return Str.toString(as_pool_get_locale(asPool));
	}

	/**
	 * Return a list of all locations which are searched for metadata.
	 *
	 * Return: A string-list of watched (absolute) filepaths
	 */
	public PtrArray getMetadataLocations()
	{
		auto p = as_pool_get_metadata_locations(asPool);
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Builds an index of all found components in the watched locations.
	 * The function will try to get as much data into the pool as possible, so even if
	 * the update completes with %FALSE, it might still have added components to the pool.
	 *
	 * The function will load from all possible data sources, preferring caches if they
	 * are up to date.
	 *
	 * Return: %TRUE if update completed without error.
	 *
	 * Throws: GException on failure.
	 */
	public bool load(Cancellable cancellable)
	{
		GError* err = null;
		
		auto p = as_pool_load(asPool, (cancellable is null) ? null : cancellable.getCancellableStruct(), &err) != 0;
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		return p;
	}

	/**
	 * Load AppStream metadata from a cache file.
	 *
	 * Params:
	 *     fname = Filename of the cache file to load into the pool.
	 *
	 * Throws: GException on failure.
	 */
	public bool loadCacheFile(string fname)
	{
		GError* err = null;
		
		auto p = as_pool_load_cache_file(asPool, Str.toStringz(fname), &err) != 0;
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		return p;
	}

	/**
	 * Load fresh metadata from AppStream directories.
	 */
	public bool loadMetadata()
	{
		return as_pool_load_metadata(asPool) != 0;
	}

	/**
	 * Update the AppStream cache. There is normally no need to call this function manually, because cache updates are handled
	 * transparently in the background.
	 *
	 * Params:
	 *     force = Enforce refresh, even if source data has not changed.
	 *
	 * Return: %TRUE if the cache was updated, %FALSE on error or if the cache update was not necessary and has been skipped.
	 *
	 * Throws: GException on failure.
	 */
	public bool refreshCache(bool force)
	{
		GError* err = null;
		
		auto p = as_pool_refresh_cache(asPool, force, &err) != 0;
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		return p;
	}

	/**
	 * Serialize AppStream metadata to a cache file.
	 *
	 * Params:
	 *     fname = Filename of the cache file the pool contents should be dumped to.
	 *
	 * Throws: GException on failure.
	 */
	public bool saveCacheFile(string fname)
	{
		GError* err = null;
		
		auto p = as_pool_save_cache_file(asPool, Str.toStringz(fname), &err) != 0;
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		return p;
	}

	/**
	 * Search for a list of components matching the search terms.
	 * The list will be unordered.
	 *
	 * Params:
	 *     search = A search string
	 *
	 * Return: an array of the found #AsComponent objects.
	 *
	 * Since: 0.9.7
	 */
	public PtrArray search(string search)
	{
		auto p = as_pool_search(asPool, Str.toStringz(search));
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Set the #AsCacheFlags for this data pool.
	 *
	 * Params:
	 *     flags = The new #AsCacheFlags.
	 */
	public void setCacheFlags(AsCacheFlags flags)
	{
		as_pool_set_cache_flags(asPool, flags);
	}

	/**
	 * Sets the current locale which should be used when parsing metadata.
	 *
	 * Params:
	 *     locale = the locale.
	 */
	public void setLocale(string locale)
	{
		as_pool_set_locale(asPool, Str.toStringz(locale));
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
		as_pool_set_metadata_locations(asPool, Str.toStringzArray(dirs));
	}
}