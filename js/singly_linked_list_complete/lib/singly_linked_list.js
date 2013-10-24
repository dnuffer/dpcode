
function SinglyLinkedListNode(data) {
  this.data = data;
  this.next_node = null;
}

exports.SinglyLinkedList = function(items) {
  this.head = null;
  this.tail = null;
  if (items) {
    for (var i = 0; i < items.length; i++) {
      this.append(items[i]);
    }
  }
};

exports.SinglyLinkedList.prototype.append = function(data) {
  return this.append_node(new SinglyLinkedListNode(data));
};

exports.SinglyLinkedList.prototype.append_node = function(node) {
  if (this.tail) {
    this.tail.next_node = node;
    this.tail = node;
  } else {
    this.head = this.tail = node;
  }
  return this;
};

exports.SinglyLinkedList.prototype.toString = function() {
  var result = "[";
  var node = this.head;
  if (node) {
    result += JSON.stringify(node.data);
    node = node.next_node;
    while (node) {
      result += " -> ";
      result += JSON.stringify(node.data);
      node = node.next_node;
    }
  }
  result += "]";
  return result;
};

exports.SinglyLinkedList.prototype.insert = function(position, data) {
  if (position == 0 && !this.tail) {
    this.append(data);
  } else {
    var node = this.head;
    var prev = null;
    while (node && position > 0) {
      prev = node;
      node = node.next_node;
      position -= 1;
    }
    if (prev) {
      prev.next_node = new SinglyLinkedListNode(data);
      prev.next_node.next_node = node;
      if (prev == this.tail) {
        this.tail = prev.next_node;
      }
    } else {
      var old_head = this.head;
      this.head = new SinglyLinkedListNode(data);
      this.head.next_node = old_head;
    }
  }
  return this;
};

exports.SinglyLinkedList.prototype.delete = function(data) {
  if (!this.head) {
    return this;
  }

  if (this.head.data === data) {
    if (this.head === this.tail) {
      this.head = this.tail = null;
    } else {
      this.head = this.head.next_node;
    }
  } else {
    var node = this.head;
    while (node.next_node) {
      if (node.next_node.data === data) {
        if (!node.next_node.next_node) {
          this.tail = node;
        }
        node.next_node = node.next_node.next_node;
      } else {
        node = node.next_node;
      }
    }
  }
  return this;
};

Object.defineProperty(exports.SinglyLinkedList.prototype, "length", {
  get: function() {
    var len = 0;
    var node = this.head;
    while (node) {
      len++;
      node = node.next_node;
    }
    return len;
  }
});

exports.SinglyLinkedList.prototype.getItem = function(index) {
  if (index >= 0) {
    var node = this.head;
    while (index > 0 && node)
    {
      node = node.next_node;
      index--;
    }
    if (node) {
      return node.data;
    }
    return;
  } else {
    var len = this.length;
    if (index * -1 > len) {
      return;
    }
    return this.getItem(len + index);
  }
};

exports.SinglyLinkedList.prototype.forEach = function forEach(callback, thisArg) {
  'use strict';
  var T, k;

  if (this == null) {
    throw new TypeError("this is null or not defined");
  }

  var kValue,
      // 1. Let O be the result of calling ToObject passing the |this| value as the argument.
      O = Object(this);

  // 4. If IsCallable(callback) is false, throw a TypeError exception.
  // See: http://es5.github.com/#x9.11
  if ({}.toString.call(callback) !== "[object Function]") {
    throw new TypeError(callback + " is not a function");
  }

  // 5. If thisArg was supplied, let T be thisArg; else let T be undefined.
  if (arguments.length >= 2) {
    T = thisArg;
  }

  var node = O.head;
  k = 0;

  while (node) {
    kValue = node.data;
    callback.call(T, kValue, k, O);
    node = node.next_node;
    k++;
  }
};
