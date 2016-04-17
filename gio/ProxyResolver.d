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


module gio.ProxyResolver;

private import gi.gio;
public  import gi.giotypes;
private import gio.ProxyResolverIF;
private import gio.ProxyResolverT;
private import gobject.ObjectG;


/** */
public class ProxyResolver : ObjectG, ProxyResolverIF
{
	/** the main GObject struct */
	protected GProxyResolver* gProxyResolver;

	/** Get the main GObject struct */
	public GProxyResolver* getProxyResolverStruct()
	{
		return gProxyResolver;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gProxyResolver;
	}

	protected override void setStruct(GObject* obj)
	{
		gProxyResolver = cast(GProxyResolver*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GProxyResolver* gProxyResolver, bool ownedRef = false)
	{
		this.gProxyResolver = gProxyResolver;
		super(cast(GObject*)gProxyResolver, ownedRef);
	}

	// add the ProxyResolver capabilities
	mixin ProxyResolverT!(GProxyResolver);

}
