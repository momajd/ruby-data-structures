/* global LinkedList */

class HashMap {
  constructor() {
    this.store = [];
    for (var i = 0; i < 8; i++) {this.store.push(new LinkedList);}

    this.count = 0;
  }

  set(key, val) {
    this.delete(key);
    if (this.count === this.numBuckets()) { this.resize(); }

    this.bucket(key).insert(key, val);
    this.count++;
    return key;
  }

  get(key) {
    this.bucket(key).get(key);
  }

  delete(key) {
    let val = this.bucket(key).delete(key);
    if (val !== null) {this.count--; }
    return val;
  }

  resize() {
    let oldStore = this.store;
    this.store = new Array(this.numBuckets *  2);
    this.count = 0;

    oldStore.forEach(bucket => {
      bucket.each(node => {
        this.set(node.key, node.val);
      });
    });
  }

  bucket(key) {
    // should hash key
    return this.store[key % this.numBuckets()];
  }

  numBuckets() {
    return this.store.length();
  }
}
