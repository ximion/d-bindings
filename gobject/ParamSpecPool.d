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


module gobject.ParamSpecPool;

private import gi.gobject;
public  import gi.gobjecttypes;
private import glib.ConstructionException;
private import glib.ListG;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.ParamSpec;


/**
 * A #GParamSpecPool maintains a collection of #GParamSpecs which can be
 * quickly accessed by owner and name. The implementation of the #GObject property
 * system uses such a pool to store the #GParamSpecs of the properties all object
 * types.
 */
public class ParamSpecPool
{
	/** the main GObject struct */
	protected GParamSpecPool* gParamSpecPool;

	/** Get the main GObject struct */
	public GParamSpecPool* getParamSpecPoolStruct()
	{
		return gParamSpecPool;
	}

	/** the main GObject struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gParamSpecPool;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GParamSpecPool* gParamSpecPool)
	{
		this.gParamSpecPool = gParamSpecPool;
	}


	/**
	 * Inserts a #GParamSpec in the pool.
	 *
	 * Params:
	 *     pspec = the #GParamSpec to insert
	 *     ownerType = a #GType identifying the owner of @pspec
	 */
	public void insert(ParamSpec pspec, GType ownerType)
	{
		g_param_spec_pool_insert(gParamSpecPool, (pspec is null) ? null : pspec.getParamSpecStruct(), ownerType);
	}

	/**
	 * Gets an array of all #GParamSpecs owned by @owner_type in
	 * the pool.
	 *
	 * Params:
	 *     ownerType = the owner to look for
	 *
	 * Return: a newly
	 *     allocated array containing pointers to all #GParamSpecs
	 *     owned by @owner_type in the pool
	 */
	public ParamSpec[] list(GType ownerType)
	{
		uint nPspecsP;
		
		auto p = g_param_spec_pool_list(gParamSpecPool, ownerType, &nPspecsP);
		
		if(p is null)
		{
			return null;
		}
		
		ParamSpec[] arr = new ParamSpec[nPspecsP];
		for(int i = 0; i < nPspecsP; i++)
		{
			arr[i] = ObjectG.getDObject!(ParamSpec)(cast(GParamSpec*) p[i]);
		}
		
		return arr;
	}

	/**
	 * Gets an #GList of all #GParamSpecs owned by @owner_type in
	 * the pool.
	 *
	 * Params:
	 *     ownerType = the owner to look for
	 *
	 * Return: a
	 *     #GList of all #GParamSpecs owned by @owner_type in
	 *     the pool#GParamSpecs.
	 */
	public ListG listOwned(GType ownerType)
	{
		auto p = g_param_spec_pool_list_owned(gParamSpecPool, ownerType);
		
		if(p is null)
		{
			return null;
		}
		
		return new ListG(cast(GList*) p);
	}

	/**
	 * Looks up a #GParamSpec in the pool.
	 *
	 * Params:
	 *     paramName = the name to look for
	 *     ownerType = the owner to look for
	 *     walkAncestors = If %TRUE, also try to find a #GParamSpec with @param_name
	 *         owned by an ancestor of @owner_type.
	 *
	 * Return: The found #GParamSpec, or %NULL if no
	 *     matching #GParamSpec was found.
	 */
	public ParamSpec lookup(string paramName, GType ownerType, bool walkAncestors)
	{
		auto p = g_param_spec_pool_lookup(gParamSpecPool, Str.toStringz(paramName), ownerType, walkAncestors);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(ParamSpec)(cast(GParamSpec*) p);
	}

	/**
	 * Removes a #GParamSpec from the pool.
	 *
	 * Params:
	 *     pspec = the #GParamSpec to remove
	 */
	public void remove(ParamSpec pspec)
	{
		g_param_spec_pool_remove(gParamSpecPool, (pspec is null) ? null : pspec.getParamSpecStruct());
	}

	/**
	 * Creates a new #GParamSpecPool.
	 *
	 * If @type_prefixing is %TRUE, lookups in the newly created pool will
	 * allow to specify the owner as a colon-separated prefix of the
	 * property name, like "GtkContainer:border-width". This feature is
	 * deprecated, so you should always set @type_prefixing to %FALSE.
	 *
	 * Params:
	 *     typePrefixing = Whether the pool will support type-prefixed property names.
	 *
	 * Return: a newly allocated #GParamSpecPool.
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(bool typePrefixing)
	{
		auto p = g_param_spec_pool_new(typePrefixing);
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GParamSpecPool*) p);
	}
}
