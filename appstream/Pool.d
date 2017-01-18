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
	 * Add a location for the data pool to read data from.
	 * If @directory contains a "xml", "xmls", "yaml" or "icons" subdirectory (or all of them),
	 * those paths will be added to the search paths instead.
	 *
	 * Params:
	 *     directory = An existing filesystem location.
	 */
	public void addMetadataLocation(string directory)
	{
		as_pool_add_metadata_location(asPool, Str.toStringz(directory));
	}

	/**
	 * Remove all metadat from the pool.
	 */
	public void clear()
	{
		as_pool_clear(asPool);
	}

	/**
	 * Remove all metadata locations from the list of watched locations.
	 */
	public void clearMetadataLocations()
	{
		as_pool_clear_metadata_locations(asPool);
	}

	/**
	 * Get the #AsCacheFlags for this data pool.
	 */
	public AsCacheFlags getCacheFlags()
	{
		return as_pool_get_cache_flags(asPool);
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
	 *     categories = An array of XDG categories to include.
	 *
	 * Return: an array of #AsComponent objects which have been found.
	 */
	public PtrArray getComponentsByCategories(string[] categories)
	{
		auto p = as_pool_get_components_by_categories(asPool, Str.toStringzArray(categories));
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Get a specific component by its ID.
	 * This function may contain multiple results if we have
	 * data describing this component from multiple scopes/origin types.
	 *
	 * Params:
	 *     cid = The AppStream-ID to look for.
	 *
	 * Return: An #AsComponent
	 */
	public PtrArray getComponentsById(string cid)
	{
		auto p = as_pool_get_components_by_id(asPool, Str.toStringz(cid));
		
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
	 */
	public PtrArray getComponentsByKind(AsComponentKind kind)
	{
		auto p = as_pool_get_components_by_kind(asPool, kind);
		
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
	 */
	public PtrArray getComponentsByProvidedItem(AsProvidedKind kind, string item)
	{
		auto p = as_pool_get_components_by_provided_item(asPool, kind, Str.toStringz(item));
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Get the #AsPoolFlags for this data pool.
	 */
	public AsPoolFlags getFlags()
	{
		return as_pool_get_flags(asPool);
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
	 * The list will be ordered by match score.
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
	 * Set the #AsPoolFlags for this data pool.
	 *
	 * Params:
	 *     flags = The new #AsPoolFlags.
	 */
	public void setFlags(AsPoolFlags flags)
	{
		as_pool_set_flags(asPool, flags);
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
}
