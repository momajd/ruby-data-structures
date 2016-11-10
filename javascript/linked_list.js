class Node {
  constructor(key, val) {
    this.key = key;
    this.val = val;
    this.prev = null;
    this.next = null;
  }
}

class LinkedList {
  constructor() {
    this.head = new Node(null, null);
    this.tail = new Node(null, null);

    this.head.next = this.tail;
    this.tail.prev = this.head;
  }

  get(key) {
    let current = this.head;

    while (current !== this.tail) {
      if (current.key === key) {return current.val;}
    }
  }

  insert(key, val) {
    let node = new Node(key, val);

    this.tail.prev.next = node;
    node.prev = this.tail.prev;
    this.tail.prev = node;
    node.next = this.tail;
    return key;
  }

  delete(key) {
    let current = this.head;

    while (current !== this.tail) {
      if (current.key === key) {
        current.prev.next = current.next;
        current.next.prev = current.prev;
        break;
      }
      current = current.next;
    }
    return current.key;
  }

  contains(key) {
    let current = this.head.next;
    while (current !== this.tail ) {
      if (current.key === key) {return true;}
      current = current.next;
    }
    return false;
  }

  draw() {
    let list = [];
    this.each( node => list.push([node.key, node.val]));
    return list.join(" -> ");
  }

  each(callback) {
    var current = this.head.next;
    while (current !== this.tail) {
      callback(current);
      current = current.next;
    }
  }
}
