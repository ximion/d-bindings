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


module gio.NetworkMonitor;

private import gi.gio;
public  import gi.giotypes;
private import gio.NetworkMonitorIF;
private import gio.NetworkMonitorT;
private import gobject.ObjectG;


/** */
public class NetworkMonitor : ObjectG, NetworkMonitorIF
{
	/** the main GObject struct */
	protected GNetworkMonitor* gNetworkMonitor;

	/** Get the main GObject struct */
	public GNetworkMonitor* getNetworkMonitorStruct()
	{
		return gNetworkMonitor;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gNetworkMonitor;
	}

	protected override void setStruct(GObject* obj)
	{
		gNetworkMonitor = cast(GNetworkMonitor*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GNetworkMonitor* gNetworkMonitor, bool ownedRef = false)
	{
		this.gNetworkMonitor = gNetworkMonitor;
		super(cast(GObject*)gNetworkMonitor, ownedRef);
	}

	// add the NetworkMonitor capabilities
	mixin NetworkMonitorT!(GNetworkMonitor);

}
