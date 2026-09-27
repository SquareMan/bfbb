#ifndef XLISTITEM_H
#define XLISTITEM_H

#include <types.h>

template <class T> struct xListItem
{
    S32 flg_travFilter;
    T* next;
    T* prev;

    xListItem()
    {
        flg_travFilter = 0;
        prev = NULL;
        next = NULL;
    }

    T* Next()
    {
        return next;
    }

    void Insert(T* list)
    {
        prev = list;
        next = list->next;

        if (list->next != NULL)
        {
            list->next->prev = (T*)this;
        }

        list->next = (T*)this;
    }
    T* RemHead(T** listhead)
    {
        if (*listhead == NULL)
        {
            return NULL;
        }

        T* head = (*listhead)->Head();

        if (head == NULL)
        {
            *listhead = NULL;
        }
        else
        {
            *listhead = head->Next();
            head->Remove();
        }

        return head;
    }
    T* Head()
    {
        T* item = (T*)this;

        if (item == NULL)
        {
            return item;
        }

        while (item->prev != NULL)
        {
            item = item->prev;
        }

        return item;
    }
    void Remove()
    {
        if (next != NULL)
        {
            next->prev = prev;
        }

        if (prev != NULL)
        {
            prev->next = next;
        }

        next = NULL;
        prev = NULL;
    }
};

#endif
