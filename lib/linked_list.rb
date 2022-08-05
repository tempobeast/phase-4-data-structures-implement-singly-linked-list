require_relative './node'

class LinkedList

    attr_accessor :head

    def initialize
        @head = nil
    end

    def prepend(node)
        if head.nil?
            self.head = node
        else
            old_head = head
            self.head = node
            head.next_node = old_head
        end

    end

    def append(node)
        if head.nil?
            self.head = node
            return
        end
        last_node = head
        while last_node.next_node
            last_node = last_node.next_node
        end
        last_node.next_node = node

    end

    def delete_head
        if head.nil?
            nil
        elsif head.next_node.nil?
            self.head = nil
        else
            new_head = head.next_node
            self.head = new_head
        end
    end

    def delete_tail
        
        if head.nil?
            nil
        elsif head.next_node.nil?
            self.head = nil
        else
            last_node = head
            while last_node.next_node
                temp = last_node
                last_node = last_node.next_node
            end
            temp.next_node = nil
            last_node = nil
        end
    end

    def add_after(index, node)
        current = head
        (index - 1).times do
            current = current.next_node
        end
        # puts "current #{current.data}"
        # puts "next #{current.next_node.data}"
        if current.next_node
        node.next_node = current.next_node.next_node
        current.next_node.next_node = node
        else
            current.next_node = node
        end
    end

    def search(value)
        last_node = head
        while last_node.next_node
            if last_node.data == value
                return last_node
            else 
                last_node = last_node.next_node
            end
        end

    end

end
