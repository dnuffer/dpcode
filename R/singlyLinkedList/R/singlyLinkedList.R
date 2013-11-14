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
        appendNode(singlyLinkedListNode(.data=item))
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
