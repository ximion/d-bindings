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


module gio.DatagramBasedIF;

private import gi.gio;
public  import gi.giotypes;
private import gio.Cancellable;
private import glib.ErrorG;
private import glib.GException;
private import glib.Source;


/**
 * Interface for socket-like objects with datagram semantics.
 *
 * Since: 2.48
 */
public interface DatagramBasedIF{
	/** Get the main GObject struct */
	public GDatagramBased* getDatagramBasedStruct();

	/** the main GObject struct as a void* */
	protected void* getStruct();


	/** */
	public GIOCondition conditionCheck(GIOCondition condition);

	/** */
	public bool conditionWait(GIOCondition condition, long timeout, Cancellable cancellable);

	/** */
	public Source createSource(GIOCondition condition, Cancellable cancellable);

	/** */
	public int receiveMessages(GInputMessage* messages, uint numMessages, int flags, long timeout, Cancellable cancellable);

	/** */
	public int sendMessages(GOutputMessage* messages, uint numMessages, int flags, long timeout, Cancellable cancellable);
}
