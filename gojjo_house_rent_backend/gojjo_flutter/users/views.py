from requests import request
from rest_framework import generics
from rest_framework.views import APIView
from users.models import User
from .serializers import UserDataSerializer, UserSerializer
from rest_framework.response import Response
from rest_framework import generics, permissions
from rest_framework.permissions import IsAuthenticatedOrReadOnly,IsAdminUser
from rest_framework import status
from rest_framework_simplejwt.tokens import RefreshToken,AccessToken

# class CustomUserCreate(APIView):
#     def post(self, request, format='json'):
#         serializer = User(data=request.data)
#         if serializer.is_valid():
#             user = serializer.save()
#             if user:
#                 json = serializer.data
#                 return Response(json,status=status.HTTP_201_CREATED)
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class UserList(generics.ListCreateAPIView):
    permission_classes = [IsAdminUser]
    queryset = User.objects.all()
    serializer_class = UserSerializer

class UserDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAdminUser]
    queryset = User.objects.all()
    serializer_class = UserSerializer

class CustomUserCreate(APIView):
    def post(self, request, format='json'):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            if user:
                json = serializer.data
                return Response(json, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class CurrentUserData(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = UserDataSerializer
    def get_object(self):
        user = self.request.user
        return user

class LoginView(APIView):

    def post(self, request): 

        email = request.data['email']

        user = User.objects.filter(email = email).first() 

        refreshtoken = RefreshToken.for_user(user)

        accesstoken = AccessToken.for_user(user) 

        if user is None:
           raise AuthenticationFailed('User not Found')

        if user.is_superuser: 
            return Response({
            'type':'admin',
            'refreshtoken': str(refreshtoken),
            'accesstoken': str(accesstoken),
            'username':user.username,
            'firstname':user.first_name,
            'middle_name':user.middle_name,
            'email':user.email,
            })

        return Response({'type':'user',

        'refreshtoken':str(refreshtoken),

        'accesstoken':str(accesstoken),

        'username':user.username,

        'first_name':user.first_name,

        'middle_name':user.middle_name,

        'email':user.email,

        })

