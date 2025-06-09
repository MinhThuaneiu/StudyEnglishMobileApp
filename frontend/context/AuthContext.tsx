import React, { createContext, useContext, useState } from "react";
import { Alert } from "react-native";

export interface User {
  id: number;
  username: string;
  email: string;
  role?: string;
  currentLevel?: number;
}

interface AuthContextType {
  user: User | null;
  /**
   * Attempts to log a user in.
   *
   * @returns true when authentication succeeds
   */
  login: (username: string, password: string) => Promise<boolean>;
  /**
   * Attempts to register a new user.
   *
   * @returns true when registration succeeds
   */
  register: (
    username: string,
    email: string,
    password: string
  ) => Promise<boolean>;
  logout: () => void;
  updateProfile: (user: User) => Promise<void>;
}

const API_URL = "http://localhost:5130/api";

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export const AuthProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  const [user, setUser] = useState<User | null>(null);

  const login = async (username: string, password: string): Promise<boolean> => {
    try {
      const res = await fetch(`${API_URL}/User/login`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ username, password }),
      });
      if (res.ok) {
        const json = await res.json();
        setUser(json);
        return true;
      } else {
        Alert.alert("Login failed");
        return false;
      }
    } catch (err) {
      console.error(err);
      Alert.alert("Login error");
      return false;
    }
  };

  const register = async (
    username: string,
    email: string,
    password: string
  ): Promise<boolean> => {
    try {
      const res = await fetch(`${API_URL}/User/register`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ username, email, password }),
      });
      if (res.ok) {
        const json = await res.json();
        setUser(json);
        return true;
      } else {
        Alert.alert("Registration failed");
        return false;
      }
    } catch (err) {
      console.error(err);
      Alert.alert("Registration error");
      return false;
    }
  };

  const updateProfile = async (info: User) => {
    if (!user) return;
    try {
      const res = await fetch(`${API_URL}/User/${user.id}`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ ...user, ...info }),
      });
      if (res.ok) {
        setUser({ ...user, ...info });
      } else {
        Alert.alert("Update failed");
      }
    } catch (err) {
      console.error(err);
      Alert.alert("Update error");
    }
  };

  const logout = () => setUser(null);

  return (
    <AuthContext.Provider value={{ user, login, register, logout, updateProfile }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => {
  const ctx = useContext(AuthContext);
  if (!ctx) throw new Error("useAuth must be used within AuthProvider");
  return ctx;
};
