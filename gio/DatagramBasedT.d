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


module gio.DatagramBasedT;

public  import gi.gio;
public  import gi.giotypes;
public  import gio.Cancellable;
public  import glib.ErrorG;
public  import glib.GException;
public  import glib.Source;


/**
 * Interface for socket-like objects with datagram semantics.
 *
 * Since: 2.48
 */
public template DatagramBasedT(TStruct)
{
	/** Get the main GObject struct */
	public GDatagramBased* getDatagramBasedStruct()
	{
		return cast(GDatagramBased*)getStruct();
	}


	/** */
	public GIOCondition conditionCheck(GIOCondition condition)
	{
		return g_datagram_based_condition_check(getDatagramBasedStruct(), condition);
	}

	/** */
	public bool conditionWait(GIOCondition condition, long timeout, Cancellable cancellable)
	{
		GError* err = null;
		
		auto p = g_datagram_based_condition_wait(getDatagramBasedStruct(), condition, timeout, (cancellable is null) ? null : cancellable.getCancellableStruct(), &err) != 0;
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		return p;
	}

	/** */
	public Source createSource(GIOCondition condition, Cancellable cancellable)
	{
		auto p = g_datagram_based_create_source(getDatagramBasedStruct(), condition, (cancellable is null) ? null : cancellable.getCancellableStruct());
		
		if(p is null)
		{
			return null;
		}
		
		return new Source(cast(GSource*) p);
	}

	/** */
	public int receiveMessages(GInputMessage* messages, uint numMessages, int flags, long timeout, Cancellable cancellable)
	{
		GError* err = null;
		
		auto p = g_datagram_based_receive_messages(getDatagramBasedStruct(), messages, numMessages, flags, timeout, (cancellable is null) ? null : cancellable.getCancellableStruct(), &err);
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		return p;
	}

	/** */
	public int sendMessages(GOutputMessage* messages, uint numMessages, int flags, long timeout, Cancellable cancellable)
	{
		GError* err = null;
		
		auto p = g_datagram_based_send_messages(getDatagramBasedStruct(), messages, numMessages, flags, timeout, (cancellable is null) ? null : cancellable.getCancellableStruct(), &err);
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		return p;
	}
}
