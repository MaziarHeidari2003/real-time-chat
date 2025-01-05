from django.db import models
from django.contrib.auth.models import User
from uuid import uuid4

class ChatGroup(models.Model):
    group_name = models.CharField(primary_key=True,default=uuid4,db_index=True)
    users_online = models.ManyToManyField(User,related_name='online_in_groups',blank=True)
    members = models.ManyToManyField(User,related_name='chat_groups',blank=True)
    is_private = models.BooleanField(default=False)

    
    def __str__(self):
        return self.group_name

class GroupMessage(models.Model):
    group = models.ForeignKey(ChatGroup,related_name='chat_messages',on_delete=models.CASCADE)
    author = models.ForeignKey(User,on_delete=models.CASCADE)
    body = models.CharField(max_length=300)
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.author}: {self.body}'
    
    class Meta:
        ordering = ['-created']

