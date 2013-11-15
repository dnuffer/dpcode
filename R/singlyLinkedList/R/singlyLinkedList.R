singlyLinkedListNode = setRefClass("singlyLinkedListNode", 
  fields = list(data = "ANY", nextNode = "ANY"),
  methods = list(
    initialize =
      function(.data = NULL, .nextNode = NULL) {
        data <<- .data
        nextNode <<- .nextNode
      }
  )
)

singlyLinkedList = setRefClass("singlyLinkedList",
  fields = list(
    head="ANY",
    tail="ANY"
  ),
  methods = list(
    initialize =
      function(items = list()) {
        head <<- NULL
        tail <<- NULL
        for (item in items) {
          append(item)
        }
      },

    append =
      function(item) {
        return(appendNode(singlyLinkedListNode(.data=item)))
      },

    appendNode =
      function(node) {
        if (!is.null(tail)) {
          tail$nextNode <<- node
        } else {
          head <<- node
          tail <<- node
        }

        while (!is.null(tail$nextNode)) {
          tail <<- tail$nextNode
        }
        return(.self)
      },

    insert =
      function(position, item) {
        if (identical(position, 0) && is.null(tail)) {
          append(item)
        } else {
          node = head
          prev = NULL
          while (!is.null(node) && position > 0) {
            prev = node
            node = node$nextNode
            position = position - 1
          }

          if (!is.null(prev)) {
            prev$nextNode = singlyLinkedListNode(.data=item)
            prev$nextNode$nextNode = node
            if (identical(prev, tail)) {
              tail <<- prev$nextNode
            }
          } else {
            oldHead = head
            head <<- singlyLinkedListNode(.data=item)
            head$nextNode <<- oldHead
          }
        }
        return(.self)
      },

    delete =
      function(data) {
        if (is.null(head)) {
          return(.self)
        }

        if (identical(head$data, data)) {
          if (identical(head, tail)) {
            head <<- NULL
            tail <<- NULL
          } else {
            head <<- head$nextNode
          }
          return(.self)
        }

        node = head

        while (!is.null(node$nextNode)) {
          if (identical(node$nextNode$data, data)) {
            if (is.null(node$nextNode$nextNode)) {
              tail <<- node
            }
            node$nextNode = node$nextNode$nextNode
            return(.self)
          }
          node = node$nextNode
        }
        return (.self)
      },

    length =
      function() {
        l = 0
        node = head
        while (!is.null(node)) {
          l = l + 1
          node = node$nextNode
        }
        return(l)
      },

    getItem =
      function(index) {
        node = head
        while (!is.null(node) && index > 1) {
          node = node$nextNode
          index = index - 1
        }
        if (is.null(node) || index <= 0 || index > 1) {
          stop("list index out of range")
        }
        return(node$data)
      },

    toString =
      function() {
        paste0("[", paste(as.list(iter()), collapse=" -> "), "]")
      },

    iter =
      function() {
        node_env <- new.env()
        assign("node", head, envir=node_env)
        nextEl = function() {
          node <- get("node", envir=node_env)
          if (!is.null(node)) {
            data = node$data
            assign("node", node$nextNode, envir=node_env)
          } else {
            stop('StopIteration')
          }
          data
        }

        obj = list(nextElem=nextEl)
        class(obj) = c('iter', 'abstractiter', 'iter')
        obj
      }
  )
)

iter.singlyLinkedList = function(obj, ...) {
  obj$iter()
}

as.list.singlyLinkedList = function(obj, ...) {
  as.list(obj$iter())
}

length.singlyLinkedList = function(obj, ...) {
  obj$length()
}

"[.singlyLinkedList" = function(slist, index) {
    return(slist$getItem(index))
}

