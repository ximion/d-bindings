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


module gio.SocketControlMessage;

private import gi.gio;
public  import gi.giotypes;
private import gobject.ObjectG;


/**
 * A #GSocketControlMessage is a special-purpose utility message that
 * can be sent to or received from a #GSocket. These types of
 * messages are often called "ancillary data".
 * 
 * The message can represent some sort of special instruction to or
 * information from the socket or can represent a special kind of
 * transfer to the peer (for example, sending a file descriptor over
 * a UNIX socket).
 * 
 * These messages are sent with g_socket_send_message() and received
 * with g_socket_receive_message().
 * 
 * To extend the set of control message that can be sent, subclass this
 * class and override the get_size, get_level, get_type and serialize
 * methods.
 * 
 * To extend the set of control messages that can be received, subclass
 * this class and implement the deserialize method. Also, make sure your
 * class is registered with the GType typesystem before calling
 * g_socket_receive_message() to read such a message.
 */
public class SocketControlMessage : ObjectG
{
	/** the main GObject struct */
	protected GSocketControlMessage* gSocketControlMessage;

	/** Get the main GObject struct */
	public GSocketControlMessage* getSocketControlMessageStruct()
	{
		return gSocketControlMessage;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gSocketControlMessage;
	}

	protected override void setStruct(GObject* obj)
	{
		gSocketControlMessage = cast(GSocketControlMessage*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GSocketControlMessage* gSocketControlMessage, bool ownedRef = false)
	{
		this.gSocketControlMessage = gSocketControlMessage;
		super(cast(GObject*)gSocketControlMessage, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return g_socket_control_message_get_type();
	}

	/**
	 * Tries to deserialize a socket control message of a given
	 * @level and @type. This will ask all known (to GType) subclasses
	 * of #GSocketControlMessage if they can understand this kind
	 * of message and if so deserialize it into a #GSocketControlMessage.
	 *
	 * If there is no implementation for this kind of control message, %NULL
	 * will be returned.
	 *
	 * Params:
	 *     level = a socket level
	 *     type = a socket control message type for the given @level
	 *     size = the size of the data in bytes
	 *     data = pointer to the message data
	 *
	 * Return: the deserialized message or %NULL
	 *
	 * Since: 2.22
	 */
	public static SocketControlMessage deserialize(int level, int type, ubyte[] data)
	{
		auto p = g_socket_control_message_deserialize(level, type, cast(size_t)data.length, data.ptr);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(SocketControlMessage)(cast(GSocketControlMessage*) p, true);
	}

	/**
	 * Returns the "level" (i.e. the originating protocol) of the control message.
	 * This is often SOL_SOCKET.
	 *
	 * Return: an integer describing the level
	 *
	 * Since: 2.22
	 */
	public int getLevel()
	{
		return g_socket_control_message_get_level(gSocketControlMessage);
	}

	/**
	 * Returns the protocol specific type of the control message.
	 * For instance, for UNIX fd passing this would be SCM_RIGHTS.
	 *
	 * Return: an integer describing the type of control message
	 *
	 * Since: 2.22
	 */
	public int getMsgType()
	{
		return g_socket_control_message_get_msg_type(gSocketControlMessage);
	}

	/**
	 * Returns the space required for the control message, not including
	 * headers or alignment.
	 *
	 * Return: The number of bytes required.
	 *
	 * Since: 2.22
	 */
	public size_t getSize()
	{
		return g_socket_control_message_get_size(gSocketControlMessage);
	}

	/**
	 * Converts the data in the message to bytes placed in the
	 * message.
	 *
	 * @data is guaranteed to have enough space to fit the size
	 * returned by g_socket_control_message_get_size() on this
	 * object.
	 *
	 * Params:
	 *     data = A buffer to write data to
	 *
	 * Since: 2.22
	 */
	public void serialize(void* data)
	{
		g_socket_control_message_serialize(gSocketControlMessage, data);
	}
}
