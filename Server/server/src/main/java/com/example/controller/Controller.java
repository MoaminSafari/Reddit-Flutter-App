package com.example.controller;
import com.example.Community;
import com.example.database.Database;
import com.example.User;
import com.google.gson.Gson;

import java.util.Arrays;

public class Controller {

    private String signUp(String userJson) {
        Gson gson = new Gson();
        User user = gson.fromJson(userJson, User.class);
        User[] users = Database.getUsers();
        for (User u : users){
            if (u.getUsername().equals(user.getUsername()))
                return "This username is already used";
            if (u.getEmail().equals(user.getEmail()))
                return "This email already has an account";
        }
        User[] result = Arrays.copyOf(users, users.length + 1);
        result[result.length - 1] = user;
        if (Database.writeUsers(result))
            return "done";
        return "error!";
    }

    private String login(String userJson) {
        Gson gson = new Gson();
        User user = gson.fromJson(userJson, User.class);
        User[] users = Database.getUsers();
        for (User u : users) {
            if (u.getUsername().equals(user.getUsername())) {
                if (u.getPassword().equals(user.getPassword()))
                    return gson.toJson(u);
                else
                    return "Password is incorrect";
            }
        }
        return "Username does not exist";
    }

    private String editProfile(String olderUser, String newerUser) {
        Gson gson = new Gson();
        User oldUser = gson.fromJson(olderUser, User.class);
        User newUser = gson.fromJson(newerUser, User.class);
        User[] users = Database.getUsers();
        for (User u : users) {
            if (u.getUsername().equals(oldUser.getUsername())) {
                u.setPassword(newUser.getPassword());
                u.setEmail(newUser.getEmail());
                break;
            }
        }
        if (Database.writeUsers(users))
            return "done";
        return "error!";
    }

    private String addCommunity(String communityJson) {
        Gson gson = new Gson();
        Community community = gson.fromJson(communityJson, Community.class);
        Community[] communities = Database.getCommunities();
        for (Community c : communities) {
            if (c.getName().equals(community.getName()))
                return "This name is already used";
        }
        Community[] result = Arrays.copyOf(communities, communities.length + 1);
        result[result.length - 1] = community;

        User[] users = Database.getUsers();
        for (User u : users) {
            if (u.getUsername().equals(community.getCommunityAdmin().getUsername())) {
                u.setCommunities(communities);
            }
        }

        if (Database.writeCommunities(result) && Database.writeUsers(users))
            return "done";
        return "error!";
    }

    private String getCommunities() {
        return new Gson().toJson(Database.getCommunities());
    }

    public String run(String request){
        String[] split = request.split(",,");
        switch (split[0]) {
            case "signUp":
                return signUp(split[1]);
            case "login":
                return login(split[1]);
            case "editProfile":
                return editProfile(split[1], split[2]);
            case "addCommunity":
                return addCommunity(split[1]);
            case "getCommunities":
                return getCommunities();
        }
        return "invalid request";
    }


}
