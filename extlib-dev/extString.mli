(*
 * ExtString - Additional functions for string manipulations.
 * Copyright (C) 2003 Nicolas Cannasse
 * 
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version,,
 * with the special exception on linking described in file LICENCE.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *)

(** Additional functions for string manipulations. *)

module String :
  sig

	(** {6 New Functions} *)

	exception Invalid_string

	val init : int -> (int -> char) -> string
	(** [init l f] returns the string of length [l] with the chars
		f 0 , f 1 , f 2 ... f (l-1). *)

	val find : string -> string -> int
	(** [find s x] returns the starting index of the string [x]
	    within the string [s] or raises [Invalid_string] if [x]
	    is not a substring of [s]. *)

	val split : string -> string -> string * string
	(** [split s sep] splits the string [s] between the first
		occurence of [sep].
	    raises [Invalid_string] if the separator is not found. *)

	val nsplit : string -> string -> string list
	(** [nsplit s sep] splits the string [s] into a list of strings
		which are separated by [sep]. *)

	val join : string -> string list -> string
	(** Same as [concat] *)

	val lchop : string -> string
	(** Returns the same string but without the first character.
	    does nothing if the string is empty. *)

	val rchop : string -> string
	(** Returns the same string but without the last character.
	   does nothing if the string is empty. *)

	val of_int : int -> string
	(** Returns the string representation of an int. *)

	val of_float : float -> string
	(** Returns the string representation of an float. *)

	val of_char : char -> string
	(** Returns a string containing one given character. *)

	val to_int : string -> int
	(** Returns the integer represented by the given string or
	    raises [Invalid_string] if the string does not represent an integer.*)

	val to_float : string -> float
	(** Returns the float represented by the given string or
	    raises Invalid_string if the string does not represent a float. *)

	val ends_with : string -> string -> bool
	(** [ends_with s x] returns true if the string [s] is ending with [x]. *)

	val starts_with : string -> string -> bool
	(** [starts_with s x] return true if [s] is starting with [x]. *)

	val enum : string -> char Enum.t
	(** Returns an enumeration of the characters of a string.*)

	val of_enum : char Enum.t -> string
	(** Creates a string from a character enumeration. *)
	
	val map : (char -> char) -> string -> string
	(** [map f s] returns a string where all characters [c] in [s] have beeen
		replaced by [f c]. **)

	val strip : ?chars:string -> string -> string
	(** Returns the string without the chars if they are at the beginning or
		at the end of the string. By default chars are " \t\r\n". *)

	(** {6 Older Functions} *)

	(** Please refer to the Ocaml Manual for documentation of these
		functions. *)

	val length : string -> int
	val get : string -> int -> char
	val set : string -> int -> char -> unit
	val create : int -> string
	val make : int -> char -> string
	val copy : string -> string
	val sub : string -> int -> int -> string
	val fill : string -> int -> int -> char -> unit
	val blit : string -> int -> string -> int -> int -> unit
	val concat : string -> string list -> string
	val iter : (char -> unit) -> string -> unit
	val escaped : string -> string
	val index : string -> char -> int
	val rindex : string -> char -> int
	val index_from : string -> int -> char -> int
	val rindex_from : string -> int -> char -> int
	val contains : string -> char -> bool
	val contains_from : string -> int -> char -> bool
	val rcontains_from : string -> int -> char -> bool
	val uppercase : string -> string
	val lowercase : string -> string
	val capitalize : string -> string
	val uncapitalize : string -> string

	type t = string
	val compare : t -> t -> int

  end
