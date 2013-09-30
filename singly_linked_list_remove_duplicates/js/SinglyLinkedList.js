
function SinglyLinkedListNode(data, next_node) {
  this.data = data;
  this.next_node = next_node;
}

function SinglyLinkedList(items) {
  this.head = null;
  this.tail = null;

  if (typeof items !== 'undefined') {
    for (var i = 0; i < items.length; i++) {
      this.append(items[i]);
    }
  }
}

SinglyLinkedList.prototype.append = function(item) {
  return this.appendNode(new SinglyLinkedListNode(item));
}

SinglyLinkedList.prototype.appendNode = function(node) {
  if (this.tail) {
    this.tail.next_node = node;
    this.tail = node;
  } else {
    this.head = this.tail = node;
  }
  return this;
}

SinglyLinkedList.prototype.insert = function(position, data) {
  if (position == 0 && !this.tail) {
    this.append(data);
  } else {
    var node = this.head;
    var prev = null;
    while (node && position > 0) {
      prev = node;
      node = node.next_node;
      position--;
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
}

SinglyLinkedList.prototype.delete = function(data) {
  if (!this.head) {
    return this;
  }

  if (this.head.data == data)
  {
    if (this.head == this.tail) {
      this.head = this.tail = null;
    } else {
      this.head = this.head.next_node;
    }
    return this;
  }

  var node = this.head;

  while (node.next_node) {
    if (node.next_node.data == data) {
      if (node.next_node.next_node == null) {
        this.tail = node;
      }
      node.next_node = node.next_node.next_node;
      return this;
    }
    node = node.next_node;
  }
  return this;
}

module.exports.SinglyLinkedList = SinglyLinkedList;
