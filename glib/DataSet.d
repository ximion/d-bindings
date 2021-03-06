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


module glib.DataSet;

private import gi.glib;
public  import gi.glibtypes;


/** */
public struct DataSet
{

	/**
	 * Destroys the dataset, freeing all memory allocated, and calling any
	 * destroy functions set for data elements.
	 *
	 * Params:
	 *     datasetLocation = the location identifying the dataset.
	 */
	public static void destroy(void* datasetLocation)
	{
		g_dataset_destroy(datasetLocation);
	}

	/**
	 * Calls the given function for each data element which is associated
	 * with the given location. Note that this function is NOT thread-safe.
	 * So unless @datalist can be protected from any modifications during
	 * invocation of this function, it should not be called.
	 *
	 * Params:
	 *     datasetLocation = the location identifying the dataset.
	 *     func = the function to call for each data element.
	 *     userData = user data to pass to the function.
	 */
	public static void foreac(void* datasetLocation, GDataForeachFunc func, void* userData)
	{
		g_dataset_foreach(datasetLocation, func, userData);
	}

	/**
	 * Gets the data element corresponding to a #GQuark.
	 *
	 * Params:
	 *     datasetLocation = the location identifying the dataset.
	 *     keyId = the #GQuark id to identify the data element.
	 *
	 * Return: the data element corresponding to the #GQuark, or %NULL if
	 *     it is not found.
	 */
	public static void* idGetData(void* datasetLocation, GQuark keyId)
	{
		return g_dataset_id_get_data(datasetLocation, keyId);
	}

	/**
	 * Removes an element, without calling its destroy notification
	 * function.
	 *
	 * Params:
	 *     datasetLocation = the location identifying the dataset.
	 *     keyId = the #GQuark ID identifying the data element.
	 *
	 * Return: the data previously stored at @key_id, or %NULL if none.
	 */
	public static void* idRemoveNoNotify(void* datasetLocation, GQuark keyId)
	{
		return g_dataset_id_remove_no_notify(datasetLocation, keyId);
	}

	/**
	 * Sets the data element associated with the given #GQuark id, and also
	 * the function to call when the data element is destroyed. Any
	 * previous data with the same key is removed, and its destroy function
	 * is called.
	 *
	 * Params:
	 *     datasetLocation = the location identifying the dataset.
	 *     keyId = the #GQuark id to identify the data element.
	 *     data = the data element.
	 *     destroyFunc = the function to call when the data element is
	 *         removed. This function will be called with the data
	 *         element and can be used to free any memory allocated
	 *         for it.
	 */
	public static void idSetDataFull(void* datasetLocation, GQuark keyId, void* data, GDestroyNotify destroyFunc)
	{
		g_dataset_id_set_data_full(datasetLocation, keyId, data, destroyFunc);
	}
}
