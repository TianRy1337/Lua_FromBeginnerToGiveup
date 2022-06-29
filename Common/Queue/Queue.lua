--- 佇列 FIFO
Queue = {}

--region Node
local Node = {}

function Node:New(iData)
    local _new =
    {
        _data = iData,
        _prev = nil,
        _next = nil
    }
    setmetatable(_new, {__index = self})
    return _new
end

function Node:data()
    return self._data
end
--endregion

function Queue:New()
    local _new =
    {
        _head = nil,
        _tail = nil
    }
    setmetatable(_new, {__index = self})
    return _new
end

function Queue:Enqueue(iData)
    local _node = Node:New(iData)
    if self._head == nil then
        self._head = _node
        self._tail = _node
    else
        self._tail._next = _node
        _node._prev = self._tail
        self._tail = _node
    end
end

function Queue:Dequeue()
    if self._head == nil then
        return nil
    elseif self._head == self._tail then
        local _out = self._head:data()
        self._head = nil
        self._tail = nil
        return _out
    end

    local _current = self._head
    _current._next.prev = nil
    self._head = _current._next
    _current._next = nil
    return _current:data()
end

function Queue:Size()
    local _count = 0
    local _current = self._head
    while _current ~= nil do
        _count = _count + 1
        _current = _current._next
    end
    return _count
end

function Queue:IsEmpty()
    if self._head == nil and self._tail == nil then
        return true
    end
    return false
end

function Queue:Peek()
    if self._head == nil then
        return nil
    end
    return self._head:data()
end

function Queue:PeekTail()
    if self._tail == nil then
        return nil
    end
    return self._tail:data()
end

function Queue:Clear()
    while self._head ~= nil do
        local _tmp = self._head._next
        self._head = nil
        self._head = _tmp
    end
    self._tail = nil
end
