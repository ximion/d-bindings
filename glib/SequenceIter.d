/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */

// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage


module glib.SequenceIter;

private import gi.glib;
public  import gi.glibtypes;
private import glib.Sequence;


/**
 * The #GSequenceIter struct is an opaque data type representing an
 * iterator pointing into a #GSequence.
 */
public class SequenceIter
{
	/** the main GObject struct */
	protected GSequenceIter* gSequenceIter;

	/** Get the main GObject struct */
	public GSequenceIter* getSequenceIterStruct()
	{
		return gSequenceIter;
	}

	/** the main GObject struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gSequenceIter;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GSequenceIter* gSequenceIter)
	{
		this.gSequenceIter = gSequenceIter;
	}


	/**
	 * Returns a negative number if @a comes before @b, 0 if they are equal,
	 * and a positive number if @a comes after @b.
	 *
	 * The @a and @b iterators must point into the same sequence.
	 *
	 * Params:
	 *     b = a #GSequenceIter
	 *
	 * Return: a negative number if @a comes before @b, 0 if they are
	 *     equal, and a positive number if @a comes after @b
	 *
	 * Since: 2.14
	 */
	public int compare(SequenceIter b)
	{
		return g_sequence_iter_compare(gSequenceIter, (b is null) ? null : b.getSequenceIterStruct());
	}

	/**
	 * Returns the position of @iter
	 *
	 * Return: the position of @iter
	 *
	 * Since: 2.14
	 */
	public int getPosition()
	{
		return g_sequence_iter_get_position(gSequenceIter);
	}

	/**
	 * Returns the #GSequence that @iter points into.
	 *
	 * Return: the #GSequence that @iter points into
	 *
	 * Since: 2.14
	 */
	public Sequence getSequence()
	{
		auto p = g_sequence_iter_get_sequence(gSequenceIter);
		
		if(p is null)
		{
			return null;
		}
		
		return new Sequence(cast(GSequence*) p);
	}

	/**
	 * Returns whether @iter is the begin iterator
	 *
	 * Return: whether @iter is the begin iterator
	 *
	 * Since: 2.14
	 */
	public bool isBegin()
	{
		return g_sequence_iter_is_begin(gSequenceIter) != 0;
	}

	/**
	 * Returns whether @iter is the end iterator
	 *
	 * Return: Whether @iter is the end iterator
	 *
	 * Since: 2.14
	 */
	public bool isEnd()
	{
		return g_sequence_iter_is_end(gSequenceIter) != 0;
	}

	/**
	 * Returns the #GSequenceIter which is @delta positions away from @iter.
	 * If @iter is closer than -@delta positions to the beginning of the sequence,
	 * the begin iterator is returned. If @iter is closer than @delta positions
	 * to the end of the sequence, the end iterator is returned.
	 *
	 * Params:
	 *     delta = A positive or negative number indicating how many positions away
	 *         from @iter the returned #GSequenceIter will be
	 *
	 * Return: a #GSequenceIter which is @delta positions away from @iter
	 *
	 * Since: 2.14
	 */
	public SequenceIter move(int delta)
	{
		auto p = g_sequence_iter_move(gSequenceIter, delta);
		
		if(p is null)
		{
			return null;
		}
		
		return new SequenceIter(cast(GSequenceIter*) p);
	}

	/**
	 * Returns an iterator pointing to the next position after @iter.
	 * If @iter is the end iterator, the end iterator is returned.
	 *
	 * Return: a #GSequenceIter pointing to the next position after @iter
	 *
	 * Since: 2.14
	 */
	public SequenceIter next()
	{
		auto p = g_sequence_iter_next(gSequenceIter);
		
		if(p is null)
		{
			return null;
		}
		
		return new SequenceIter(cast(GSequenceIter*) p);
	}

	/**
	 * Returns an iterator pointing to the previous position before @iter.
	 * If @iter is the begin iterator, the begin iterator is returned.
	 *
	 * Return: a #GSequenceIter pointing to the previous position
	 *     before @iter
	 *
	 * Since: 2.14
	 */
	public SequenceIter prev()
	{
		auto p = g_sequence_iter_prev(gSequenceIter);
		
		if(p is null)
		{
			return null;
		}
		
		return new SequenceIter(cast(GSequenceIter*) p);
	}
}
