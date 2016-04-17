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


module glib.HashTableIter;

private import gi.glib;
public  import gi.glibtypes;
private import glib.HashTable;


/**
 * A GHashTableIter structure represents an iterator that can be used
 * to iterate over the elements of a #GHashTable. GHashTableIter
 * structures are typically allocated on the stack and then initialized
 * with g_hash_table_iter_init().
 */
public class HashTableIter
{
	/** the main GObject struct */
	protected GHashTableIter* gHashTableIter;

	/** Get the main GObject struct */
	public GHashTableIter* getHashTableIterStruct()
	{
		return gHashTableIter;
	}

	/** the main GObject struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gHashTableIter;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GHashTableIter* gHashTableIter)
	{
		this.gHashTableIter = gHashTableIter;
	}


	/**
	 * Returns the #GHashTable associated with @iter.
	 *
	 * Return: the #GHashTable associated with @iter.
	 *
	 * Since: 2.16
	 */
	public HashTable getHashTable()
	{
		auto p = g_hash_table_iter_get_hash_table(gHashTableIter);
		
		if(p is null)
		{
			return null;
		}
		
		return new HashTable(cast(GHashTable*) p);
	}

	/**
	 * Initializes a key/value pair iterator and associates it with
	 * @hash_table. Modifying the hash table after calling this function
	 * invalidates the returned iterator.
	 * |[<!-- language="C" -->
	 * GHashTableIter iter;
	 * gpointer key, value;
	 *
	 * g_hash_table_iter_init (&iter, hash_table);
	 * while (g_hash_table_iter_next (&iter, &key, &value))
	 * {
	 * // do something with key and value
	 * }
	 * ]|
	 *
	 * Params:
	 *     hashTable = a #GHashTable
	 *
	 * Since: 2.16
	 */
	public void init(HashTable hashTable)
	{
		g_hash_table_iter_init(gHashTableIter, (hashTable is null) ? null : hashTable.getHashTableStruct());
	}

	/**
	 * Advances @iter and retrieves the key and/or value that are now
	 * pointed to as a result of this advancement. If %FALSE is returned,
	 * @key and @value are not set, and the iterator becomes invalid.
	 *
	 * Params:
	 *     key = a location to store the key, or %NULL
	 *     value = a location to store the value, or %NULL
	 *
	 * Return: %FALSE if the end of the #GHashTable has been reached.
	 *
	 * Since: 2.16
	 */
	public bool next(void** key, void** value)
	{
		return g_hash_table_iter_next(gHashTableIter, key, value) != 0;
	}

	/**
	 * Removes the key/value pair currently pointed to by the iterator
	 * from its associated #GHashTable. Can only be called after
	 * g_hash_table_iter_next() returned %TRUE, and cannot be called
	 * more than once for the same key/value pair.
	 *
	 * If the #GHashTable was created using g_hash_table_new_full(),
	 * the key and value are freed using the supplied destroy functions,
	 * otherwise you have to make sure that any dynamically allocated
	 * values are freed yourself.
	 *
	 * It is safe to continue iterating the #GHashTable afterward:
	 * |[<!-- language="C" -->
	 * while (g_hash_table_iter_next (&iter, &key, &value))
	 * {
	 * if (condition)
	 * g_hash_table_iter_remove (&iter);
	 * }
	 * ]|
	 *
	 * Since: 2.16
	 */
	public void remove()
	{
		g_hash_table_iter_remove(gHashTableIter);
	}

	/**
	 * Replaces the value currently pointed to by the iterator
	 * from its associated #GHashTable. Can only be called after
	 * g_hash_table_iter_next() returned %TRUE.
	 *
	 * If you supplied a @value_destroy_func when creating the
	 * #GHashTable, the old value is freed using that function.
	 *
	 * Params:
	 *     value = the value to replace with
	 *
	 * Since: 2.30
	 */
	public void replace(void* value)
	{
		g_hash_table_iter_replace(gHashTableIter, value);
	}

	/**
	 * Removes the key/value pair currently pointed to by the
	 * iterator from its associated #GHashTable, without calling
	 * the key and value destroy functions. Can only be called
	 * after g_hash_table_iter_next() returned %TRUE, and cannot
	 * be called more than once for the same key/value pair.
	 *
	 * Since: 2.16
	 */
	public void steal()
	{
		g_hash_table_iter_steal(gHashTableIter);
	}
}
