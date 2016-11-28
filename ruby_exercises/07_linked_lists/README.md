# Linked Lists

##Using Ruby to create a linked list and associated methods
###About:

A linked list is a linear collection of data elements called nodes that "point" to the next node by means of a pointer.

Each node holds a single element of data and a link or pointer to the next node in the list.

A head node is the first node in the list, a tail node is the last node in the list. Below is a basic representation of a linked list:

``` ruby
[ NODE(head) ] -> [ NODE ] -> [ NODE(tail) ] -> nil
```
###User Stories:

* Create two classes:
  1. `LinkedList` class, which will represent the full list.
  2. `Node` class, containing a `#value` method and a link to the `#next_node`, set both as `nil` by default.

* `#append` adds a new node to the end of the list
* `#prepend` adds a new node to the start of the list
* `#size` returns the total number of nodes in the list
* `#head` returns the first node in the list
* `#tail` returns the last node in the list
* `#at(index)` returns the node at the given index
* `#pop` removes the last element from the list
* `#contains?` returns true if the passed in value is in the list and otherwise returns false.
* `#find(data)` returns the index of the node containing data, or nil if not found.
* `#to_s` represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( data ) -> ( data ) -> ( data ) -> nil
