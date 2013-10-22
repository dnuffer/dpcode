
function SinglyLinkedListNode(data) {
  this.data = data;
  this.next_node = null;
}

exports.SinglyLinkedList = function(items) {
  this.head = null;
  this.tail = null;
}

exports.SinglyLinkedList.prototype.append = function(data) {
  return this.append_node(new SinglyLinkedListNode(data));
}

exports.SinglyLinkedList.prototype.append_node = function(node) {
  if (this.tail) {
    this.tail.next_node = node;
    this.tail = node;
  } else {
    this.head = this.tail = node;
  }
  return this;
}

