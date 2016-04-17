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


module gio.LoadableIconT;

public  import gi.gio;
public  import gi.giotypes;
public  import gio.AsyncResultIF;
public  import gio.Cancellable;
public  import gio.InputStream;
public  import glib.ErrorG;
public  import glib.GException;
public  import glib.Str;
public  import gobject.ObjectG;


/**
 * Extends the #GIcon interface and adds the ability to
 * load icons from streams.
 */
public template LoadableIconT(TStruct)
{
	/** Get the main GObject struct */
	public GLoadableIcon* getLoadableIconStruct()
	{
		return cast(GLoadableIcon*)getStruct();
	}


	/**
	 * Loads a loadable icon. For the asynchronous version of this function,
	 * see g_loadable_icon_load_async().
	 *
	 * Params:
	 *     size = an integer.
	 *     type = a location to store the type of the loaded
	 *         icon, %NULL to ignore.
	 *     cancellable = optional #GCancellable object, %NULL to
	 *         ignore.
	 *
	 * Return: a #GInputStream to read the icon from.
	 *
	 * Throws: GException on failure.
	 */
	public InputStream load(int size, out string type, Cancellable cancellable)
	{
		char* outtype = null;
		GError* err = null;
		
		auto p = g_loadable_icon_load(getLoadableIconStruct(), size, &outtype, (cancellable is null) ? null : cancellable.getCancellableStruct(), &err);
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		type = Str.toString(outtype);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(InputStream)(cast(GInputStream*) p, true);
	}

	/**
	 * Loads an icon asynchronously. To finish this function, see
	 * g_loadable_icon_load_finish(). For the synchronous, blocking
	 * version of this function, see g_loadable_icon_load().
	 *
	 * Params:
	 *     size = an integer.
	 *     cancellable = optional #GCancellable object, %NULL to ignore.
	 *     callback = a #GAsyncReadyCallback to call when the
	 *         request is satisfied
	 *     userData = the data to pass to callback function
	 */
	public void loadAsync(int size, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		g_loadable_icon_load_async(getLoadableIconStruct(), size, (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Finishes an asynchronous icon load started in g_loadable_icon_load_async().
	 *
	 * Params:
	 *     res = a #GAsyncResult.
	 *     type = a location to store the type of the loaded
	 *         icon, %NULL to ignore.
	 *
	 * Return: a #GInputStream to read the icon from.
	 *
	 * Throws: GException on failure.
	 */
	public InputStream loadFinish(AsyncResultIF res, out string type)
	{
		char* outtype = null;
		GError* err = null;
		
		auto p = g_loadable_icon_load_finish(getLoadableIconStruct(), (res is null) ? null : res.getAsyncResultStruct(), &outtype, &err);
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		type = Str.toString(outtype);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(InputStream)(cast(GInputStream*) p, true);
	}
}
